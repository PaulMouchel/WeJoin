class FavoritesController < ApplicationController
	before_action :set_user
  before_action :set_favorite, only: [:edit, :update, :destroy]

  def index
    @favorite_places = @user.favorite_places.all
  end

  def new
    @favorite = Favorite.new
  end

  def edit
  end

  def create
    @favorite = Favorite.new(user_id: params[:user_id], favorite_place_id: params[:place])

    respond_to do |format|
      if @favorite.save
  			format.html { redirect_back(fallback_location: root_path) }
        format.json { render :show, status: :created, location: @favorite }
      else
        format.html { flash.now[:error] = @favorite.errors.full_messages.to_sentence
          redirect_back(fallback_location: root_path) }
        format.json { render json: @favorite.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @favorite.update(favorite_params)
        format.html { redirect_to @favorite 
        flash[:success] = 'Favorite was successfully updated.' }
        format.json { render :show, status: :ok, location: @favorite }
      else
        format.html { flash.now[:error] = @favorite.errors.full_messages.to_sentence
          redirect_back(fallback_location: root_path) }
        format.json { render json: @favorite.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @favorite.destroy
    respond_to do |format|
    	format.html { redirect_back(fallback_location: root_path) }
      format.json { head :no_content }
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
