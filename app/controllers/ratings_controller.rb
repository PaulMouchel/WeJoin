class RatingsController < ApplicationController
  before_action :set_rating, only: [:show, :edit, :update, :destroy]

  def index
    @ratings = Rating.all
  end

  def show
  end

  def new
    @rating = Rating.new
  end

  def edit
  end

  def create
    #@rating = Rating.new(rating_params)
		@place = Place.find(params[:place_id])
    @rating = current_user.rate_place(@place, params[:stars])
    respond_to do |format|
      if @rating.save
        format.html { redirect_back(fallback_location: root_path) 
        flash[:success] = 'Rating was successfully created.' }
        format.json { render :show, status: :created, location: @rating }
      else
        format.html { flash.now[:error] = @rating.errors.full_messages.to_sentence
          redirect_back(fallback_location: root_path) }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @rating.update(rating_params)
        format.html { redirect_to @rating 
        flash[:success] = 'Rating was successfully updated.' }
        format.json { render :show, status: :ok, location: @rating }
      else
        format.html { flash.now[:error] = @rating.errors.full_messages.to_sentence
          render :edit }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @rating.destroy
    respond_to do |format|
      format.html { redirect_to ratings_url 
      flash[:success] = 'Rating was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_rating
      @rating = Rating.find(params[:id])
    end

    def rating_params
      params.permit(:stars, :place_id, :user_id)
    end
end
