Rails.application.routes.draw do
  resources :place_tags
  resources :tags
  resources :ratings
	root 'cities#index'
  resources :cities, except: [:show] do
    resources :city_pics, only: [:create]
    resources :places do 
      resources :place_pics, only: [:create]
    end
  end
  devise_for :users 
  resources :users, only: [:show, :edit, :update, :destroy] do
    resources :user_pics, only: [:create]
  	resources :favorites
  	resources :attendances
  end
end
