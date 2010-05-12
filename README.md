## Fumblr - Stop fumbling with your [Tumblr](http://tumblr.com) themes

I loved [Thimblr](http://github.com/jphastings/thimblr) but it didn't quite fit my workflow. I wanted an easy way to manage an asset host for external css/js/images, and I also wanted to use Sass and Compass.

### Get started

Install Padrino

    sudo gem install padrino
    
Clone the project

    git clone http://github.com/pengwynn/fumblr.git <yoursite>
    
* Edit your theme in tumblr.html
* Add external assets in public under css/js/images
* Enter your `asset_host` in `public/fumblr.yml`

Crank up the server with

    padrino start
    
or run under [Passenger](http://modrails.com) with something like `yoursite.local`

## Import your own Tumblr content

    padrino rake import

Once you're ready to deploy, copy your assets to your asset host and  paste the contents of theme.html into Tumblr.


## Note on Patches/Pull Requests
 
* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but
   bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2010 Wynn Netherland. See LICENSE for details.