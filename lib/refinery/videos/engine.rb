module Refinery
  module Videos
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Videos

      engine_name :refinery_videos

      initializer 'attach-refinery-videos-with-dragonfly', after: :load_config_initializers do |app|
        ::Refinery::Videos::Dragonfly.configure!
        ::Refinery::Videos::Dragonfly.attach!(app)
      end

      initializer "register refinerycms_videos plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "videos"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.videos_admin_videos_path }
          plugin.pathname = root
        end
      end

      config.to_prepare do
        require 'refinery/videos/dialogs_controller'

        Rails.application.config.assets.precompile << %w(refinery/admin/wymeditor_monkeypatch.js refinery/admin/video.css)
      end
      config.after_initialize do
        Refinery.register_extension(Refinery::Videos)
      end
    end
  end
end
