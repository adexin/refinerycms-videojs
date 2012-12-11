Refinery::Admin::DialogsController.class_eval do
  Refinery::Admin::DialogsController::TYPES << 'video'
  def find_iframe_src_with_video
    if @dialog_type == 'video'
      @iframe_src = refinery.insert_videos_admin_videos_path url_params.merge(:dialog => true)
    else
      find_iframe_src_without_video
    end
  end
  alias_method_chain :find_iframe_src, :video
end