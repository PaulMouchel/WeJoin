class CitiesController < ApplicationController
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

    respond_to do |format|
      if @city.save
        format.html { redirect_to city_places_path(@city) 
        flash[:success] = 'City was successfully created.' }
        format.json { render :show, status: :created, location: @city }
      else
        format.html { flash.now[:error] = @city.errors.full_messages.to_sentence
          render :new }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @city.update(city_params)
        format.html { redirect_to city_places_path(@city) 
        flash[:success] = 'City was successfully updated.' }
        format.json { render :show, status: :ok, location: @city }
      else
        format.html { flash.now[:error] = @city.errors.full_messages.to_sentence
          render :edit }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @city.destroy
    @city.city_pic.purge
    respond_to do |format|
      format.html { redirect_to city_places_path 
      flash[:success] = 'City was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_city
      @city = City.find(params[:id])
    end

    def city_params
      params.require(:city).permit(:name, :city_pic)
    end
end
