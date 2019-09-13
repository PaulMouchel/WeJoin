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
    respond_to do |format|
      if @place.save
        format.html { redirect_to admin_city_places_path(@city) 
        flash[:success] = 'Le nouveau lieu a bien été créé ! :)' }
        format.json { render :show, status: :created, location: @place }
      else
        format.html { flash.now[:error] = @place.errors.full_messages.to_sentence
          render :new }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @place.update(place_params)
        format.html { redirect_to admin_city_places_path(@city) 
        flash[:success] = 'Le lieu a bien été modifié ! :)' }
        format.json { render :show, status: :ok, location: @place }
      else
        format.html { flash.now[:error] = @place.errors.full_messages.to_sentence
          render :edit }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @place.destroy
    @place.place_pics.purge
    respond_to do |format|
      format.html { redirect_to admin_city_places_path(@city) 
      flash[:success] = 'Le lieu a bien été supprimé.' }
      format.json { head :no_content }
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
      params.require(:place).permit(:name, :address, :description, :coffee_price, :tea_price, :beer_price, :wifi_identification, :wifi_password, :all_tags,
      place_pics: [])
    end
end
