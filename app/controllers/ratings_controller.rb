class RatingsController < ApplicationController

  def create
		@place = Place.find(params[:place_id])
    @rating = current_user.rate_place(@place, params[:stars])
    respond_to do |format|
      if @rating.save
        format.html { redirect_back(fallback_location: root_path) 
        flash[:success] = 'Ton vote a bien été pris en compte !' }
        format.js { }
      else
        format.html { flash.now[:error] = @rating.errors.full_messages.to_sentence
        redirect_back(fallback_location: root_path) }
        format.js { }
      end
    end
  end

  private
    def rating_params
      params.permit(:stars, :place_id, :user_id)
    end
end
