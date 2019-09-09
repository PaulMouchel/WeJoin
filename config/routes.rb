Rails.application.routes.draw do
	root 'cities#index'
  resources :cities
  devise_for :users
end
