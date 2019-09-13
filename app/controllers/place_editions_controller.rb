class PlaceEditionsController < ApplicationController
  before_action :set_city, only: [:create, :new]
  before_action :set_place, only: [:create, :new, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy]


  def new
    @place_edition = PlaceEdition.new(name: @place.name, address: @place.address, description: @place.description, coffee_price: @place.coffee_price, tea_price: @place.tea_price, beer_price: @place.beer_price, wifi_password: @place.wifi_password,
    place_pics: @place.place_pics)  
  end

  def create
    @place_edition = PlaceEdition.new(place_edition_params)
    @place_edition.place = @place
      if @place_edition.save
        redirect_to city_place_path(@city, @place) 
        flash[:success] = "Merci ! Notre équipe validera tes modifications d'ici peu !"
      else
        flash.now[:error] = @place_edition.errors.full_messages.to_sentence
        render :new
      end
    end
  end

  private
    def set_city
      @city = City.find(params[:city_id])
    end

    def set_place
      @place = Place.find(params[:place_id])
    end

    def place_edition_params
      params.require(:place_edition).permit(:name, :address, :description, :coffee_price, :tea_price, :beer_price, :wifi_password,
      place_pics: [])
    end
end
