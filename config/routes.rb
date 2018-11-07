Beehive::Engine.routes.draw do
  devise_for :users, path: :auth, class_name: 'Beehive::User', module: :devise

  namespace :admin do
    root to: 'dashboard#index'

    resources :users
    resource :settings, only: [:show] do
      resource :general, only: %i[edit update], on: :collection, module: :settings, controller: :general
    end
  end

  namespace :api do
    namespace :v1 do
      jsonapi_resources :users
      jsonapi_resources :roles
    end
  end
end
