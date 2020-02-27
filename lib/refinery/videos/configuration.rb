module Refinery
  module Videos
    include ActiveSupport::Configurable

    config_accessor :dragonfly_insert_before, :dragonfly_secret, :dragonfly_server_root,
                    :max_file_size, :pages_per_dialog, :pages_per_admin_index,
                    :s3_backend, :s3_bucket_name, :s3_region,
                    :s3_access_key_id, :s3_secret_access_key,
                    :datastore_root_path, :trust_file_extensions, :whitelisted_mime_types, :skin_css_class

    self.dragonfly_insert_before = 'ActionDispatch::Callbacks'
    self.dragonfly_secret = Refinery::Dragonfly.secret
    self.dragonfly_server_root = 'public'
    self.trust_file_extensions = false
    self.max_file_size = 524288000
    self.pages_per_dialog = 7
    self.pages_per_admin_index = 20
    self.whitelisted_mime_types = %w(video/mp4 video/x-flv application/ogg video/webm video/flv video/ogg)
    self.skin_css_class = "vjs-default-skin"

    class << self
      def datastore_root_path
        config.datastore_root_path || Rails.root.join('public', 'system', 'refinery', 'videos').to_s
      end

      def s3_backend
        config.s3_backend.nil? ? Refinery::Core.config.s3_backend : config.s3_backend
      end

      def s3_bucket_name
        config.s3_bucket_name.nil? ? Refinery::Core.s3_bucket_name : config.s3_bucket_name
      end

      def s3_access_key_id
        config.s3_access_key_id.nil? ? Refinery::Core.s3_access_key_id : config.s3_access_key_id
      end

      def s3_secret_access_key
        config.s3_secret_access_key.nil? ? Refinery::Core.s3_secret_access_key : config.s3_secret_access_key
      end
    end
  end
end
