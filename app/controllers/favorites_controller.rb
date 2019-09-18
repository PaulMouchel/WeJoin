class FavoritesController < ApplicationController
	before_action :set_user
  before_action :set_favorite, only: [:destroy]
  before_action :check_user, only: [:create, :destroy]

  def index
    @favorite_places = @user.favorite_places.sort_by{ |place| place.name.upcase}
  end

  def create
    place = Place.find(favorite_params[:place])
    @favorite = current_user.add_favorite(place)
    if @favorite.save
    	respond_to do |format|
  			format.html { redirect_back(fallback_location: root_path) }
        format.js { }
      end
    else
      flash.now[:error] = @favorite.errors.full_messages.to_sentence
      redirect_back(fallback_location: root_path)
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
    	params.permit(:place)
    end

	  def check_user
	    redirect_to cities_path if @user != current_user
	  end
end
