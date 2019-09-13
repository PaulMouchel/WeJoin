class AttendancesController < ApplicationController
	before_action :set_place, only: [:create]
  before_action :set_attendance, only: [:show, :edit, :update, :destroy]

  def index
    @attendances = Attendance.all
  end

  def show
  end

  def new
    @attendance = Attendance.new
  end

  def edit
  end

  def create
    @attendance = Attendance.new(attendance_params, )

    respond_to do |format|
      if @attendance.save
        format.html { redirect_to city_place_path(@place.city, @place)
        flash[:success] = 'Attendance was successfully created.' }
        format.json { render :show, status: :created, location: @attendance }
      else
        format.html { flash.now[:error] = @attendance.errors.full_messages.to_sentence
          redirect_back(fallback_location: root_path) }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @attendance.update(attendance_params)
        format.html { redirect_to @attendance 
        flash[:success] = 'Attendance was successfully updated.' }
        format.json { render :show, status: :ok, location: @attendance }
      else
        format.html { flash.now[:error] = @attendance.errors.full_messages.to_sentence
          render :edit }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @attendance.destroy
    respond_to do |format|
      format.html { redirect_to attendances_url 
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
      #params.require(:attendance).permit(:date)
      params.permit(:date, :user_id, :place_id)
    end
end
