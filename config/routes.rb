Beehive::Engine.routes.draw do
  devise_for :users, class_name: 'Beehive::User', module: :devise
end
