Refinery::Core::Engine.routes.prepend do
  match '/system/videos/*dragonfly', :to => Dragonfly.app(:refinery_videos), via: [:get, :post]

  # Frontend routes
  namespace :videos do
    resources :videos, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :videos, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :videos do
        post :append_to_wym
        collection do
          post :update_positions
          get :insert
          get :dialog_preview
        end
      end
      resources :video_files, :only => [:destroy]
    end
  end

end
