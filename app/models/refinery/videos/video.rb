require 'dragonfly'

module Refinery
  module Videos
    class Video < Refinery::Core::BaseModel

      self.table_name = 'refinery_videos'
      acts_as_indexed :fields => [:title]

      validates :title, :presence => true
      validate :one_source

      has_many :video_files, :dependent => :destroy
      accepts_nested_attributes_for :video_files

      belongs_to :poster, :class_name => '::Refinery::Image'
      accepts_nested_attributes_for :poster

      ################## Video config options
      serialize :config, Hash
      CONFIG_OPTIONS = {
          :autoplay => "false", :width => "400", :height => "300",
          :controls => "true", :preload => "true", :loop => "true"
      }

      attr_accessible :title, :poster_id, :video_files_attributes,
                      :position, :config, :embed_tag, :use_shared,
                      *CONFIG_OPTIONS.keys

      # Create getters and setters
      CONFIG_OPTIONS.keys.each do |option|
        define_method option do
          self.config[option]
        end
        define_method "#{option}=" do |value|
          self.config[option] = value
        end
      end
      #######################################

      ########################### Callbacks
      after_initialize :set_default_config
      #####################################

      def to_html
        if use_shared
          update_from_config
          return embed_tag.html_safe
        end

        data_setup = []
        CONFIG_OPTIONS.keys.each do |option|
          if option && (option != :width && option != :height)
            data_setup << "\"#{option}\": #{config[option] || '\"auto\"'}"
          end
        end

        data_setup << "\"poster\": \"#{poster.url}\"" if poster
        sources = []
        video_files.each do |file|
          if file.use_external
            sources << ["<source src='#{file.external_url}' type='#{file.file_mime_type}'/>"]
          else
            sources << ["<source src='#{file.url}' type='#{file.file_mime_type}'/>"]
          end if file.exist?
        end
        html = %Q{<video id="video_#{self.id}" class="video-js vjs-default-skin" width="#{config[:width]}" height="#{config[:height]}" data-setup=' {#{data_setup.join(',')}}'>#{sources.join}</video>}

        html.html_safe
      end


      def short_info
        return [['.shared_source', embed_tag.scan(/src=".+?"/).first]] if use_shared
        info = []
        video_files.each do |file|
          info << file.short_info
        end

        info
      end

      ####################################class methods
      class << self
        def per_page(dialog = false)
          dialog ? Videos.pages_per_dialog : Videos.pages_per_admin_index
        end
      end
      #################################################

      private

      def set_default_config
        if new_record? && config.empty?
          CONFIG_OPTIONS.each do |option, value|
            self.send("#{option}=", value)
          end
        end
      end

      def update_from_config
        embed_tag.gsub!(/width="(\d*)?"/, "width=\"#{config[:width]}\"")
        embed_tag.gsub!(/height="(\d*)?"/, "height=\"#{config[:height]}\"")
        #fix iframe overlay
        if embed_tag.include? 'iframe'
          embed_tag =~ /src="(\S+)"/
          embed_tag.gsub!(/src="\S+"/, "src=\"#{$1}?wmode=transparent\"")
        end
      end

      def one_source
        errors.add(:embed_tag, 'Please embed video') if use_shared && embed_tag.nil?
        errors.add(:video_files, 'Please select at least one source') if !use_shared && video_files.empty?
      end

    end

  end
end
