Rails.application.routes.draw do
  root 'cities#home'
  namespace :admin do
    get '/places', to: 'places#all'
    resources :place_editions, except: [:edit, :new, :create]
  	resources :tags, except: [:show]
    resources :cities, except: [:show] do
      resources :city_pics, only: [:create, :destroy]
      resources :places do 
        resources :places_submissions, only: [:update, :destroy]
        resources :opening_hours
      end
    end
    resources :users do
      resources :user_pics, only: [:create, :destroy]
      resources :attendances
    end
  end
  resources :cities, only: [:index] do
    resources :city_pics, only: [:create, :destroy]
    resources :places, except: [:update, :destroy] do 
      resources :place_pics, only: [:create, :destroy]
      resources :place_editions, only: [:new, :create]
    end
  end
  devise_for :users 
  resources :users, only: [:show, :edit, :update, :destroy] do
    resources :user_pics, only: [:create, :destroy]
  	resources :favorites, only: [:index, :create, :destroy]
  	resources :attendances, only: [:index, :create, :destroy]
  	resources :ratings, only: [:create]
    resources :rating_outlets, only: [:create]
    resources :rating_noise_levels, only: [:create]
    resources :rating_comforts, only: [:create]
    resources :rating_wifis, only: [:create]

  end
end
