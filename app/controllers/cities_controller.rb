class CitiesController < ApplicationController
  def index
    @cities = City.all
  end
  
  def home
    if current_user != nil
      if current_user.city != nil
        redirect_to city_places_path(current_user.city)
      else
        redirect_to cities_path
      end
    else 
      redirect_to cities_path
    end
  end
end
