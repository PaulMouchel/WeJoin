class PlacePicsController < ApplicationController
  def create
    @city = City.find(params[:city_id])
    @place = Place.find(params[:place_id])
    @place.place_pics.attach(params[:place_pics])
    redirect_to(city_place_path(@city, @place))
  end

  def destroy
    @city = City.find(params[:city_id])
    @place = Place.find(params[:place_id])
    index = params[:index].to_i
    if index >= 0 && index < @place.place_pics.length
      @place.place_pics[index].purge
    end
    redirect_to(admin_city_place_path(@city, @place))
  end
end
