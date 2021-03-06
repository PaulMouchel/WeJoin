class CitiesController < ApplicationController
  def index
		@user = current_user
    respond_to do |format|
      format.html { @cities = City.all.sort_by{ |city| city.name.upcase} }
      format.js { @cities = City.where("lower(name) like ?", "%" + params[:search].downcase + "%").sort_by{ |city| city.name.upcase} }
    end
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
