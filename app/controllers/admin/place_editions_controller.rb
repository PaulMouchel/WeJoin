class Admin::PlaceEditionsController < AdminController
  before_action :set_place_edition, only: [:show, :update, :destroy]
  before_action :set_city, only: [:show, :update, :destroy]
  before_action :set_place, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:show, :index]


  def index
    @place_editions = PlaceEdition.all
  end

  def show
  end

  def update
    @place.update(name: @place_edition.name, address: @place_edition.address, description: @place_edition.description, coffee_price: @place_edition.coffee_price, tea_price: @place_edition.tea_price, beer_price: @place_edition.beer_price, wifi_password: @place_edition.wifi_password, tags: @place_edition.tags)  
    @place_edition.destroy
    redirect_to admin_place_editions_path 
    flash[:success] = 'La proposition de modification a bien été pris en compte !' 
  end

  def destroy
    @place_edition.destroy
    redirect_to admin_place_editions_path 
    flash[:success] = 'La proposition de modification a bien été annulée' 
  end

  private
    def set_city
      @city = @place_edition.place.city
    end

    def set_place
      @place = @place_edition.place
    end

    def set_place_edition
      @place_edition = PlaceEdition.find(params[:id])
    end
end
