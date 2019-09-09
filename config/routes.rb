Rails.application.routes.draw do
	root 'cities#index'
  resources :cities do
  	resources :places
  end
  devise_for :users 
end
