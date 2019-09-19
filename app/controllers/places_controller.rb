class PlacesController < ApplicationController
	before_action :set_city
  before_action :set_place, only: [:show, :edit]
  before_action :authenticate_user!, only: [:new, :show, :create]

  def index
  	@latitude = @city.latitude
    @longitude = @city.longitude
  	respond_to do |format|
      format.html { @places = @city.places.where(validated: true).sort_by{ |place| place.name.upcase} }
      format.js { @places = @city.places.where(validated: true).where("lower(name) like ?", "%" + params[:search].downcase + "%").sort_by{ |place| place.name.upcase} }
    end
  end

  def show
    @attendances = @place.attendances
    @attendances_today = @place.attendances.where(date: get_today)
  end

  def new
    @place = Place.new
  end

  def edit
  end

  def create
    @place = Place.new(place_params)
    @place.city = @city
    if @place.save
      redirect_to city_places_path(@city) 
      flash[:success] = "Super ! Merci beaucoup ! Le lieu que tu as proposé a bien été envoyé à notre équipe, qui le validera d'ici peu !"
    else
      flash.now[:error] = @place.errors.full_messages.to_sentence
      render :new
    end
  end

  private
  	def set_city
      @city = City.find(params[:city_id])
    end

    def set_place
      @place = Place.find(params[:id])
    end

    def place_params
      params.require(:place).permit(:name, :address, :description, :coffee_price, :tea_price, :beer_price, :wifi_identification, 
      :wifi_password, :city_id, all_tags: [],
      place_pics: [])
    end

    def get_today
      Time.now.to_date
    end
end
