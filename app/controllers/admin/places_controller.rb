class Admin::PlacesController < AdminController
	before_action :set_city, except: [:all]
  before_action :set_place, only: [:show, :edit, :update, :destroy]

  def all
    @validated = Place.where(reviewed: true, validated: true)
    @non_validated = Place.where(validated: false, reviewed: true)
    @to_be_validated = Place.where(reviewed: false, validated: false)
  end

  def index
    @places = @city.places
  end

  def show
  end

  def new
    @place = Place.new
    @tags = Tag.all
  end

  def edit
  end

  def create
    @place = Place.new(place_params)
    @place.city = @city
    if @place.save
      redirect_to admin_city_places_path(@city) 
      flash[:success] = 'Le nouveau lieu a bien été créé ! :)'
    else
      flash.now[:error] = @place.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    if @place.update(place_params)
      redirect_to admin_city_places_path(@city) 
      flash[:success] = 'Le lieu a bien été modifié ! :)'
    else
      flash.now[:error] = @place.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @place.destroy
    @place.place_pics.purge
    redirect_to admin_places_path
    flash[:success] = 'Le lieu a bien été supprimé.'
  end

  private
  	def set_city
      @city = City.find(params[:city_id])
    end

    def set_place
      @place = Place.find(params[:id])
    end

    def place_params
      params.require(:place).permit(:name, :address, :longitude, :latitude, :description, :coffee_price, :tea_price, :beer_price, :wifi_identification, :wifi_password, :all_tags,
      place_pics: [])
    end
end
