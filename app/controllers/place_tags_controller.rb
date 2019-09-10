class PlaceTagsController < ApplicationController
  before_action :set_place_tag, only: [:show, :edit, :update, :destroy]

  def index
    @place_tags = PlaceTag.all
  end

  def show
  end

  def new
    @place_tag = PlaceTag.new
  end

  def edit
  end

  def create
    @place_tag = PlaceTag.new(place_tag_params)

    respond_to do |format|
      if @place_tag.save
        format.html { redirect_to @place_tag 
        flash[:success] = 'Place tag was successfully created.' }
        format.json { render :show, status: :created, location: @place_tag }
      else
        format.html { flash.now[:error] = @place_tag.errors.full_messages.to_sentence
          render :new }
        format.json { render json: @place_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @place_tag.update(place_tag_params)
        format.html { redirect_to @place_tag 
        flash[:success] = 'Place tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @place_tag }
      else
        format.html { flash.now[:error] = @place_tag.errors.full_messages.to_sentence
          render :edit }
        format.json { render json: @place_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @place_tag.destroy
    respond_to do |format|
      format.html { redirect_to place_tags_url 
      flash[:success] = 'Place tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_place_tag
      @place_tag = PlaceTag.find(params[:id])
    end

    def place_tag_params
      params.fetch(:place_tag, {})
    end
end
