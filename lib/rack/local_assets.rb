require 'nokogiri'

module Rack
  class LocalAssets
    def initialize(app, options={})
      @app = app
      @options = options
    end

    def call(env)
      status, headers, response = @app.call(env)

      content = ''
      response.each{|str| content += str}

      doc = Nokogiri::HTML(content)
      links = doc.css("link[rel=stylesheet]")
      links.each do |link|
        link['href'] = link['href'].gsub(%r{(https?:)?//#{@options[:asset_host]}},  '')
      end

      response = doc.to_s
      headers["Content-Length"] = response.length.to_s
      [status, headers, [response]]
    end
  end
end
