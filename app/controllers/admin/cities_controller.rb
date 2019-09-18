class Admin::CitiesController < AdminController
  before_action :set_city, only: [:edit, :update, :destroy]

  def index
    @cities = City.all
  end

  def new
    @city = City.new
  end

  def edit
  end

  def create
    @city = City.new(city_params)
    if @city.save
      redirect_to admin_city_places_path(@city) 
      flash[:success] = 'La nouvelle ville a bien été créée ! :)'
    else
      flash.now[:error] = @city.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    if @city.update(city_params)
      redirect_to admin_city_places_path(@city) 
      flash[:success] = 'La ville a bien été modifiée ! :)'
    else
      flash.now[:error] = @city.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @city.destroy
    @city.city_pic.purge
    redirect_to admin_cities_path 
    flash[:success] = 'La ville a bien été supprimée de la base.'
  end

  private
    def set_city
      @city = City.find(params[:id])
    end

    def city_params
      params.require(:city).permit(:name, :latitude, :longitude, :city_pic)
    end
end
