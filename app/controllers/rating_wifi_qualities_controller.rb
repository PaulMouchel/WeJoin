class RatingWifiQualitiesController < ApplicationController

	def create
		@place = Place.find(params[:place_id])
	    @rating = current_user.rate_place_wifi_qualities(@place, params[:wifi_qualities])
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
     	params.permit(:wifi_qualities, :place_id, :user_id)
    end

end
