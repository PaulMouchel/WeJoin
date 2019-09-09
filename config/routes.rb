Rails.application.routes.draw do
  resources :places
	root 'cities#index'
  resources :cities
  devise_for :users
end
