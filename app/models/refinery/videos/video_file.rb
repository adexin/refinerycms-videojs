require 'dragonfly'

module Refinery
  module Videos
    class VideoFile < Refinery::Core::BaseModel

      self.table_name = 'refinery_video_files'
      acts_as_indexed :fields => [:file_name, :file_ext]
      attr_accessible :file, :file_mime_type, :position, :use_external, :external_url
      belongs_to :video

      MIME_TYPES = {'.mp4' => 'mp4', '.flv' => 'flv', '.webm' => 'webm', '.ogg' => 'ogg', '.ogv' => 'ogg'}

      ############################ Dragonfly
      ::Refinery::Videos::Dragonfly.setup!
      video_accessor :file

      delegate :ext, :size, :mime_type, :url,
               :to        => :file,
               :allow_nil => true

      #######################################

      ########################### Validations
      validates :file, :presence => true, :unless => :use_external?
      validates :mime_type, :inclusion => { :in =>  Refinery::Videos.config[:whitelisted_mime_types],
                                            :message => "Wrong file mime_type" }, :if => :file_name?
      validates :external_url, :presence => true, :if => :use_external?
      #######################################

      before_save :set_mime_type
      before_update :set_mime_type

      def exist?
        use_external ? external_url.present? : file.present?
      end

      def short_info
        if use_external
           ['.link', external_url]
        else
           ['.file', file_name]
        end
      end

      private

      def set_mime_type
        if use_external
          type = external_url.scan(/\.\w+$/)
          if type.present? && MIME_TYPES.has_key?(type.first)
            self.file_mime_type = "video/#{MIME_TYPES[type.first]}"
          else
            self.file_mime_type = 'video/mp4'
          end
        end

      end


    end
  end
end
