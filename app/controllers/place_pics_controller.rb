class PlacePicsController < ApplicationController
  def create
    @city = City.find(params[:city_id])
    @place = Place.find(params[:place_id])
    @place.place_pic.attach(params[:place_pic])
    redirect_to(city_place_path(@city, @place))
  end
end
