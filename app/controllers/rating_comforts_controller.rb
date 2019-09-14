class RatingComfortsController < ApplicationController
def create
		@place = Place.find(params[:place_id])
	    @rating = current_user.rate_place_comforts(@place, params[:comforts])
	    respond_to do |format|
	      if @rating.save
	        format.html { redirect_back(fallback_location: root_path) 
	        flash[:success] = 'Rating was successfully created.' }
	        format.js { }
	      else
	        format.html { flash.now[:error] = @rating.errors.full_messages.to_sentence
	          redirect_back(fallback_location: root_path) }
	        format.js { flash.now[:error] = @rating.errors.full_messages.to_sentence
		redirect_back(fallback_location: root_path)}
	      end
	    end
  	end

  	private

    def rating_params
     	params.permit(:comforts, :place_id, :user_id)
    end
end