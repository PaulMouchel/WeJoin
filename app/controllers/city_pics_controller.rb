class CityPicsController < ApplicationController
  def create
    @city = City.find(params[:city_id])
    @city.city_pic.attach(params[:city_pic])
    redirect_to(city_path(@city))
  end
end