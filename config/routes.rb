Rails.application.routes.draw do
  resources :favorites
	root 'cities#index'
  resources :cities do
  	resources :places
  end
  devise_for :users 
end
