Rails.application.routes.draw do

  namespace :admin do
  	resources :tags
    resources :cities, except: [:show] do
      resources :city_pics
      resources :places do 
        resources :place_pics
      end
    end
    resources :users do
      resources :user_pics, only: [:create]
      resources :favorites, except: [:show]
      resources :attendances
    end
  end
  resources :place_tags
  resources :tags
	root 'cities#index'
  resources :cities, only: [:index] do
    resources :city_pics, only: [:create]
    resources :places, except: [:edit, :update, :destroy] do 
      resources :place_pics, only: [:create]
    end
  end
  devise_for :users 
  resources :users, only: [:show, :edit, :update, :destroy] do
    resources :user_pics, only: [:create]
  	resources :favorites, except: [:show]
  	resources :attendances
  	resources :ratings
  end
end
