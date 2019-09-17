class RatingComfortsController < ApplicationController
	def create
		@place = Place.find(rating_params[:place_id])
    @rating = current_user.rate_place_comforts(@place, rating_params[:comforts])
    if @rating.save
    	respond_to do |format|
        format.html { redirect_back(fallback_location: root_path) 
        flash[:success] = 'Ton vote a bien été pris en compte !' }
        format.js { }
      end
    else
      flash.now[:error] = @rating.errors.full_messages.to_sentence
      redirect_back(fallback_location: root_path)
    end
	end

  private

  def rating_params
   	params.permit(:comforts, :place_id)
  end
end
