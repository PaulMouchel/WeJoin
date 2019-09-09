class PlacePicsController < ApplicationController
  def create
    @place = Place.find(params[:place_id])
    @place.place_pic.attach(params[:place_pic])
    redirect_to(place_path(@place))
  end
end
