class CitiesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :redirect_to_root, except: [:index, :show]


  def index
    @cities = City.all
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  private
    def redirect_to_root
      redirect_to cities_path
    end
end
