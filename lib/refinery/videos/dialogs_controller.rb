module DialogsControllerFindVideoIframeSrc
  def find_iframe_src
    if @dialog_type == 'video'
      @iframe_src = refinery.insert_videos_admin_videos_path url_params.merge(:dialog => true)
    else
      super
    end
  end
end

Refinery::Admin::DialogsController.class_eval do
  Refinery::Admin::DialogsController::TYPES << 'video'
  prepend(DialogsControllerFindVideoIframeSrc)
end
