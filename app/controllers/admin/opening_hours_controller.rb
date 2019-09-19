class Admin::OpeningHoursController < AdminController
  before_action :set_city
  before_action :set_place
  before_action :set_opening_hour, only: [:edit, :update, :destroy]

  def index 
  end

  def new
    @opening_hour = OpeningHour.new
  end

  def edit
  end

  def create
    @opening_hour = OpeningHour.new(opening_hour_params)
    @opening_hour.place = @place
    if @opening_hour.save
      redirect_to new_admin_city_place_opening_hour_path(@city, @place)
      flash[:success] = 'Les horaires ont bien été créés ! :)'
    else
      flash.now[:error] = @opening_hour.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    @opening_hour.update(opening_hour_params)
    if @opening_hour.save
      redirect_to new_admin_city_place_opening_hour_path(@city, @place)
      flash[:success] = 'Le compte utilisateur a bien été modifié !'
    else
      flash.now[:error] = @opening_hour.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @opening_hour.destroy
    redirect_to admin_city_place_opening_hours_path(@city, @place)
    flash[:success] = 'Le compte utilisateur a bien été supprimé.'
  end

  private
  def set_city
    @city = City.find(params[:city_id])
  end

  def set_place
    @place = Place.find(params[:place_id])
  end

  def set_opening_hour
    @opening_hour = OpeningHour.find(params[:id])
  end

  def opening_hour_params
    params.require(:opening_hour).permit(:place_id, :day_of_week, :open, :close)
  end
end
