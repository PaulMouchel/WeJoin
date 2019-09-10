class FavoritesController < ApplicationController
  before_action :set_favorite, only: [:show, :edit, :update, :destroy]

  def index
    @favorites = Favorite.all
  end

  def show
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
          render :new }
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
          render :edit }
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
    def set_favorite
      @favorite = Favorite.find(params[:id])
    end

    def favorite_params
      params.fetch(:favorite, {})
    end
end
