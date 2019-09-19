class AttendancesController < ApplicationController
	before_action :set_place, only: [:create, :destroy]
  before_action :set_attendance, only: [:destroy]

  def index
    @attendances = current_user.attendances
    @past_attendances = current_user.attendances.where(date: Date.new..1.day.ago)
  end

  def create
    @attendance = Attendance.new(attendance_params)
    @attendances = @place.attendances
    @attendance.user = current_user
    if current_user.has_attendance(@attendance.date)
      redirect_back(fallback_location: root_path)
      flash[:error] = 'Impossible de créer deux participations à la même date'
    else
	    if @attendance.save
      	respond_to do |format|
	        format.html { redirect_back(fallback_location: root_path)
	        	flash[:success] = 'Attendance was successfully created.' }
	        format.js { set_params_for_place_show_view }
      	end
      else
        flash.now[:error] = @attendance.errors.full_messages.to_sentence
          redirect_back(fallback_location: root_path)
      end
  	end
  end

  def destroy
  	if @attendance.user == current_user
    	@attendance.destroy
    end
    @attendances = @place.attendances
    @my_attendances = current_user.attendances
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path)
      	flash[:success] = 'Attendance was successfully destroyed.' }
      format.js { 
      	if params[:from] == "attendances"
      		#if the request comes from view Attendances/Index
	      	params[:action] = "index"
	      elsif params[:from] == "place"
	      	#if the request comes from view Place/Show
        	set_params_for_place_show_view
	      end
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

    def set_params_for_place_show_view
    	params[:controller] = "places"
    	params[:action] = "show"
    	params[:city_id] = @place.city.id
    	params[:id] = params[:place_id]
    end
end
