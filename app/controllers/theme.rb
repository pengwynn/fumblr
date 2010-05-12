Fumblr.controllers :theme do
  before do
    config = YAML.load_file(Padrino.root("public/fumblr.yml")) if File.exists?(Padrino.root("public/fumblr.yml"))
    config ||= {}
    
    if username = config['username'] and File.exists?(Padrino.root("public/#{username}.yml"))
      data_path = Padrino.root("public/#{username}.yml") 
    else
      data_path = Padrino.root("config/demo.yml")
    end
    
    theme_path = Padrino.root("public/tumblr.html")
    
    @parser = Parser.new(data_path, theme_path, config)
  end

  # get :stylesheet, :map => "/css/:file.css" do
  #   content_type 'text/css', :charset => 'utf-8'
  #   sass :file
  # end
  
  get :root, :map => "/" do
    
    @parser.render_posts
    
  end

  
end