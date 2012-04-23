module Refinery
  class VideojsGenerator < Rails::Generators::Base
    source_root File.expand_path('../videos/templates', __FILE__)

    def rake_db
      rake("refinery_videojs:install:migrations")
    end

    def generate_videos_initializer
      template "config/initializers/refinery/videos.rb.erb", File.join(destination_root, "config", "initializers", "refinery", "videos.rb")
    end

    def generate_videojs_loader
      template "assets/javascripts/videojs_loader.js", File.join(destination_root, "app", "assets", "javascripts", "videojs_loader.js")
    end

  end
end
