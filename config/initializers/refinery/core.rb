Refinery::Core.configure do |config|
  # Register extra javascript for backend
  config.register_javascript "refinery/admin/wymeditor_monkeypatch.js"

  #Register extra stylesheet for backend (optional options)
  config.register_stylesheet "refinery/admin/video.css"
end
