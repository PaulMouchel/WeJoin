Rails.application.routes.draw do
	root 'cities#index'
  resources :cities do
  	resources :places
  end
  devise_for :users 
  resources :users, only: [:show, :edit, :update, :destroy]
end
