Rails.application.routes.draw do
  root 'cities#home'
  namespace :admin do
    get '/places', to: 'places#all'
  	resources :tags, except: [:show]
    resources :cities, except: [:show] do
      resources :city_pics, only: [:create, :destroy]
      resources :places do 
        resources :places_submissions, only: [:update, :destroy]
      end
    end
    resources :users do
      resources :user_pics, only: [:create, :destroy]
      resources :attendances
    end
  end
  resources :place_tags
  resources :cities, only: [:index] do
    resources :city_pics, only: [:create, :destroy]
    resources :places, except: [:edit, :update, :destroy] do 
      resources :place_pics, only: [:create, :destroy]
    end

  end
  devise_for :users 
  resources :users, only: [:show, :edit, :update, :destroy] do
    resources :user_pics, only: [:create, :destroy]
  	resources :favorites, only: [:index, :create, :destroy]
  	resources :attendances
  	resources :ratings, only: [:create]
    resources :rating_outlets, only: [:create]
    resources :rating_noise_levels, only: [:create]
    resources :rating_wifi_qualities, only: [:create]
  end
end
