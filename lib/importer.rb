require 'open-uri'
require 'nokogiri'
require 'yaml'
require 'uri'

module Thimblr
  class Import
    def self.username(username)
      data = {}
      begin
        xml = Nokogiri::XML(open("http://#{username}.tumblr.com/api/read"))
      rescue OpenURI::HTTPError
        raise "Username not found"
      end
  
      data['Title'] = xml.search('tumblelog')[0]['title']
      data['Description'] = xml.search('tumblelog')[0].content
  
      data['Posts'] = []
      xml.search('posts post').each do |xpost|
        post = {
          'PostId' => xpost['id'].to_i,
          'Permalink' => xpost['url'],
          'Type' => xpost['type'].capitalize,
          'Timestamp' => xpost['unix-timestamp'].to_i,
          'Tags' => xpost.search('tag').collect{ |tag| tag.content }
        }
    
        post['Type'] = "Text" if post['Type'] == "Regular"
        post['Type'] = "Chat" if post['Type'] == "Conversation"
    
        post.store('Title', xpost.search("#{xpost['type']}-title")[0].content) rescue nil
    
        post.store('Caption',xpost.search("#{xpost['type']}-caption")[0].content) rescue nil
    
        post.store('LinkURL',xpost.search("#{xpost['type']}-link-url")[0].content) rescue nil

        post.store('Source',xpost.search("#{xpost['type']}-source")[0].content) rescue nil
    
        case post['Type']
        when "Photo"
          xpost.search('photo-url').each do |photo|
            post["PhotoURL-#{photo['max-width']}"] = photo.content
          end
        when "Link"
          begin
            post['Name'] = xpost.search("link-text")[0].content
          rescue
          end
        when "Video"
          post['Player'] = xpost.search("video-player")[0].content
        when "Text"
          post['Body'] = xpost.search("regular-body")[0].content
        end
    
        data['Posts'].push post
      end
      
      # Pages
      begin
        xml = Nokogiri::XML(open("http://#{username}.tumblr.com/api/pages"))
        data['Pages'] = []
        
        xml.search('pages').children.each do |re|
          case re.name
          when "redirect"
            data['Pages'].push({
              "Label" => re['link-title'],
              "URL"   => re['redirect-to']
            })
          when "page"
            data['Pages'].push({
              "Label"   => re['link-title'],
              "URL"     => URI.split(re['url'])[5],
              "Title"   => re['title'],
              "InTheme" => (re['render-in-theme'] == "true"),
              "Body"    => re.content
            })
          end
        end
        # Do pages
      rescue OpenURI::HTTPError
        # No pages
      end
      
      YAML::dump(data)
    end
  end
end