require 'dragonfly'
require 'dragonfly/s3_data_store'

module Refinery
  module Videos
    module Dragonfly

      class << self
        def setup!
          app_videos = ::Dragonfly.app(:refinery_videos)
        end

        def configure!
          app_videos = ::Dragonfly.app(:refinery_videos)
          app_videos.configure do
            datastore :file,
              root_path: Refinery::Videos.datastore_root_path,
              server_root: Refinery::Videos.dragonfly_server_root,
              secret: Refinery::Videos.dragonfly_secret
          end

          if ::Refinery::Videos.s3_backend
            app_videos.configure do
              datastore :s3,
                bucket_name: Refinery::Videos.s3_bucket_name,
                access_key_id: Refinery::Videos.s3_access_key_id,
                secret_access_key: Refinery::Videos.s3_secret_access_key,
                # S3 Region otherwise defaults to 'us-east-1'
                region: Refinery::Videos.s3_region if Refinery::Videos.s3_region
            end
          end
        end

        def attach!(app)
        end
      end

    end
  end
end
