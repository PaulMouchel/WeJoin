class AttendancesController < ApplicationController
	before_action :set_place, only: [:create, :destroy]
  before_action :set_attendance, only: [:destroy]

  def index
  	@attendances = current_user.attendances
  end

  def create
    @attendance = Attendance.new(attendance_params)
    @attendances = @place.attendances
    respond_to do |format|
      if @attendance.save
        format.html { redirect_back(fallback_location: root_path)
        flash[:success] = 'Attendance was successfully created.' }
        format.js {
        	params[:controller] = "places"
        	params[:action] = "show"
        	params[:city_id] = @place.city.id
        	params[:id] = params[:place_id]
        	params.delete :user_id
        	params.delete :date
        }
      else
        format.html { flash.now[:error] = @attendance.errors.full_messages.to_sentence
          redirect_back(fallback_location: root_path) }
        format.js { flash.now[:error] = @attendance.errors.full_messages.to_sentence
          redirect_back(fallback_location: root_path) }
      end
    end
  end

  def destroy
    @attendance.destroy
    @attendances = @place.attendances
    @my_attendances = current_user.attendances
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path)
      flash[:success] = 'Attendance was successfully destroyed.' }
      format.js { 
      	params.delete :place_id
      	params.delete :id
      	params[:action] = "index"

      }
    end
  end

  private
  	def set_place
      @place = Place.find(params[:place_id])
    end

    def set_attendance
      @attendance = Attendance.find(params[:id])
    end

    def attendance_params
      params.permit(:date, :user_id, :place_id)
    end
end
