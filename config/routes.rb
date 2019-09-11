Rails.application.routes.draw do

  namespace :admin do
    resources :cities, except: [:show] do
      resources :city_pics, only: [:create, :destroy]
      resources :places
    end
    resources :users do
      resources :user_pics, only: [:create, :destroy]
      resources :favorites, except: [:show, :destroy]
      resources :attendances
    end
  end
  resources :place_tags
  resources :tags
	root 'cities#index'
  resources :cities, only: [:index] do
    resources :city_pics, only: [:create, :destroy]
    resources :places, except: [:edit, :update, :destroy] do 
      resources :place_pics, only: [:create, :destroy]
    end
  end
  devise_for :users 
  resources :users, only: [:show, :edit, :update, :destroy] do
    resources :user_pics, only: [:create, :destroy]
  	resources :favorites, except: [:show]
  	resources :attendances
  	resources :ratings
  end
end
