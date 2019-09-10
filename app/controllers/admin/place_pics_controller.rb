class Admin::PlacePicsController < AdminController
  def create
    @city = City.find(params[:city_id])
    @place = Place.find(params[:place_id])
    @place.place_pics.attach(params[:place_pics])
    redirect_to(admin_city_place_path(@city, @place))
  end
end
