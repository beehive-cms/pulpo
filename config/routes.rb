Beehive::Engine.routes.draw do
  devise_for :users, path: :auth, class_name: 'Beehive::User', module: :devise

  namespace :admin do
    resources :users
    resource :general_settings, only: [:edit, :update]
  end

  namespace :api do
    namespace :v1 do
      jsonapi_resources :users
      jsonapi_resources :roles
    end
  end
end
