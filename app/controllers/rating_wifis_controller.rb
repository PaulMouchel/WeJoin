class RatingWifisController < ApplicationController

	def create
		@place = Place.find(params[:place_id])
	    @rating = current_user.rate_place_wifis(@place, params[:wifis])
	    respond_to do |format|
	      if @rating.save
	        format.html { redirect_back(fallback_location: root_path) 
	        flash[:success] = 'Rating was successfully created.' }
	        format.js { }
	      else
	        format.html { flash.now[:error] = @rating.errors.full_messages.to_sentence
	          redirect_back(fallback_location: root_path) }
	        format.json { render json: @rating.errors, status: :unprocessable_entity }
	      end
	    end
  	end

  	private

    def rating_params
     	params.permit(:wifis, :place_id, :user_id)
    end

end
