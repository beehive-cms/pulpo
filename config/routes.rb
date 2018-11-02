Beehive::Engine.routes.draw do
  root to: 'users#index'
  devise_for :users, class_name: 'Beehive::User', module: :devise
end
