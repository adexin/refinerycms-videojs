Refinery::Core.configure do |config|

  # Add extra tags to the wymeditor whitelist e.g. = {'tag' => {'attributes' => {'1' => 'href'}}} or just {'tag' => {}}
  config.wymeditor_whitelist_tags = {'video' => {'attributes' => {'1' => 'poster', '2' => 'width', '3' => 'height', '4' => 'source', '5' => 'controls'} },
                                     'source' => {'attributes' => {'1' => 'src', '2' => 'type'}}}
  # Register extra javascript for backend
  config.register_javascript "refinery/admin/wymeditor_monkeypatch.js"

  #Register extra stylesheet for backend (optional options)
  config.register_stylesheet "refinery/admin/video.css"
end