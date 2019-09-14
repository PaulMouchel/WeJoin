class AttendancesController < ApplicationController
	before_action :set_place, only: [:create]
  before_action :set_attendance, only: [:destroy]

  def index
    @attendances = current_user.attendances
  end

  def create
    @attendance = Attendance.new(attendance_params)

    respond_to do |format|
      if @attendance.save
        format.html { redirect_back(fallback_location: root_path)
        flash[:success] = 'Attendance was successfully created.' }
        format.js { }
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
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path)
      flash[:success] = 'Attendance was successfully destroyed.' }
      format.json { head :no_content }
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
