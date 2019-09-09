Rails.application.routes.draw do

  resources :tags
  resources :ratings
	root 'cities#index'
  resources :cities do
    resources :city_pics, only: [:create]
    resources :places do 
      resources :place_pics, only: [:create]
    end
  end
  devise_for :users 
  resources :users, only: [:show, :edit, :update, :destroy] do
    resources :favorites
    resources :user_pics, only: [:create]
  end

end
