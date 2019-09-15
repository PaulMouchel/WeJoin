class FavoritesController < ApplicationController
	before_action :set_user
  before_action :set_favorite, only: [:destroy]

  def index
    @favorite_places = @user.favorite_places.all
  end

  def create
    @favorite = Favorite.new(user_id: params[:user_id], favorite_place_id: params[:place])

    respond_to do |format|
      if @favorite.save
  			format.html { redirect_back(fallback_location: root_path) }
        format.js { }
      else
        format.html { flash.now[:error] = @favorite.errors.full_messages.to_sentence
          redirect_back(fallback_location: root_path) }
        format.js { }
      end
    end
  end

  def destroy
  	if @favorite.user == current_user
	    @favorite.destroy
	  end
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
end
