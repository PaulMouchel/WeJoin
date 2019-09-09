Rails.application.routes.draw do

  resources :attendances
  resources :tags
  resources :ratings
	root 'cities#index'
  resources :cities do
  	resources :places
  end
  devise_for :users 
  resources :users, only: [:show, :edit, :update, :destroy] do
  	resources :favorites
  end

end
