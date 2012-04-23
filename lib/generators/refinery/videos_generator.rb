module Refinery
  class VideosGenerator < Rails::Generators::Base
    source_root File.expand_path('../videos/templates', __FILE__)

    def rake_db
      puts "="*100
      rake("refinery_videos:install:migrations")
    end

    def generate_videos_initializer
      template "config/initializers/refinery/videos.rb.erb", File.join(destination_root, "config", "initializers", "refinery", "videos.rb")
    end

    def generate_videojs_loader
      template "assets/javascripts/videojs_loader.js", File.join(destination_root, "app", "assets", "javascripts", "videojs_loader.js")
    end

  end
end
