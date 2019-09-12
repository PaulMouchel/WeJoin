class Admin::PlacesSubmissionsController < AdminController
  before_action :set_place, only: [:show, :edit, :update, :destroy]

  def index
    @places = Place.where(reviewed: true)
    @non_reviewed = Place.where(reviewed: false)
    @validated = Place.where(validated: true)
    @non_validated = Place.where(validated: false)
  end

  def show
  end

  def update #to validate
  	@place.reviewed = true
    @place.validated = true
    puts @place.reviewed 
    puts @place.validated
  	if @place.save
  		redirect_to admin_places_path
  	else
  		redirect_to admin_city_place_path(@place.city, @place)
  	end
  end

  def destroy #to invalidate
  	@place.reviewed = true
    @place.validated = false
  	if @place.save
  		redirect_to admin_places_path
  	else
      redirect_to admin_city_place_path(@place.city, @place)
  	end
  end

  private
  def set_place
    @place = Place.find(params[:id])
  end

  def place_params
    params.require(:place).permit(:name, :address, :description, :coffee_price, :tea_price, :beer_price, :wifi_password, :all_tags,
    place_pics: [])
  end
end