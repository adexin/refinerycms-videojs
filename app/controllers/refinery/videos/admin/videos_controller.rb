module Refinery
  module Videos
    module Admin
      class VideosController < ::Refinery::AdminController

        crudify :'refinery/videos/video',
                :title_attribute => 'title',
                :xhr_paging => true,
                :order => 'position ASC',
                :sortable => true

        before_filter :set_embedded, :only => [:new, :create]

        def show
          @video = Video.find(params[:id])
        end

        def new
          @video = Video.new
          @video.video_files.build
        end

        def insert
          search_all_videos if searching?
          find_all_videos
          paginate_videos
        end

        def append_to_wym
          @video = Video.find(params[:video_id])
          params['video'].each do |key, value|
            @video.config[key.to_sym] = value
          end
          @html_for_wym = @video.to_html
        end

        def dialog_preview
          @video = Video.find(params[:id].delete('video_'))
          w, h = @video.config[:width], @video.config[:height]
          @video.config[:width], @video.config[:height] = 300, 200
          @preview_html = @video.to_html
          @video.config[:width], @video.config[:height] = w, h
          @embedded = true if @video.use_shared
        end

        private

        def paginate_videos
          @videos = @videos.paginate(:page => params[:page], :per_page => Video.per_page(true))
        end

        def set_embedded
          @embedded = true if params['embedded']
        end

      end
    end
  end
end
