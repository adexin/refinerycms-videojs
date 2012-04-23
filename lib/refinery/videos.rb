require 'refinerycms-core'
require 'dragonfly'
require 'rack/cache'


module Refinery
  autoload :VideosGenerator, 'generators/refinery/videojs_generator'

  module Videos
    require 'refinery/videos/engine'
    require 'refinery/videos/configuration'
    autoload :Dragonfly, 'refinery/videos/dragonfly'
    autoload :Validators, 'refinery/videos/validators'

    class << self
      attr_writer :root

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def factory_paths
        @factory_paths ||= [ root.join('spec', 'factories').to_s ]
      end
    end
  end
end

