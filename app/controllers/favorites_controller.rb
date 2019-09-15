class FavoritesController < ApplicationController
	before_action :set_user
  before_action :set_favorite, only: [:destroy]
  before_action :check_user, only: [:create, :destroy]

  def index
    @favorite_places = @user.favorite_places.all
  end

  def create
    place = Place.find(params[:place])
    @favorite = current_user.add_favorite(place)
    
    respond_to do |format|
      if @favorite.save
  			format.html { redirect_back(fallback_location: root_path) }
        format.js { }
      else
        format.html { flash.now[:error] = @favorite.errors.full_messages.to_sentence
          redirect_back(fallback_location: root_path) }
        format.js { flash.now[:error] = @favorite.errors.full_messages.to_sentence
          redirect_back(fallback_location: root_path) }
      end
    end
  end

  def destroy
	  @favorite.destroy
    respond_to do |format|
    	format.html { redirect_back(fallback_location: root_path) }
      format.js { }
    end
  end

  private
  	def set_user
      @user = User.find(params[:user_id])
    end

    def set_favorite
      @favorite = Favorite.find(params[:id])
    end

    def favorite_params
      params.fetch(:favorite, {})
    end

	  def check_user
	    redirect_to cities_path if @user != current_user
	  end
end
