Rails.application.routes.draw do
  resources :place_tags
  resources :tags
  resources :ratings
	root 'cities#index'
  resources :cities do
  	resources :places
  end
  devise_for :users 
  resources :users, only: [:show, :edit, :update, :destroy] do
  	resources :favorites
  	resources :attendances
  end

end
