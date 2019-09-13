class PlacesController < ApplicationController
	before_action :set_city
  before_action :set_place, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :show, :create, :update]

  def index
    @places = @city.places.where(validated: true)
  end

  def show
  	@attendances = @place.attendances
  end

  def new
    @place = Place.new
  end

  def edit
  end

  def create
    @place = Place.new(place_params)
    @place.city = @city
    respond_to do |format|
      if @place.save
        format.html { redirect_to city_places_path(@city) 
        flash[:success] = 'Great ! Thank you very much ! Your place was successfully sent and will be reviewed shorty by the team !' }
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
        format.html { redirect_to city_places_path(@city) 
        flash[:success] = 'Place was successfully updated.' }
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
      format.html { redirect_to city_places_path(@city) 
      flash[:success] = 'Place was successfully destroyed.' }
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
      params.require(:place).permit(:name, :address, :description, :coffee_price, :tea_price, :beer_price, :wifi_password, :city_id,
      place_pics: [])
    end
end
