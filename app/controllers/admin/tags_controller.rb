class Admin::TagsController < AdminController
  before_action :set_tag, only: [:edit, :update, :destroy]

  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def edit
  end

  def create
    @tag = Tag.new(tag_params)

    respond_to do |format|
      if @tag.save
        format.html { redirect_to admin_tags_path 
        flash[:success] = 'Le tag a bien été créé !' }
        format.json { render :show, status: :created, location: @tag }
      else
        format.html { flash.now[:error] = @tag.errors.full_messages.to_sentence
          render :new }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @tag.update(tag_params)
        format.html { redirect_to admin_tags_path 
        flash[:success] = 'Le tag a bien été modifié.' }
        format.json { render :show, status: :ok, location: @tag }
      else
        format.html { flash.now[:error] = @tag.errors.full_messages.to_sentence
          render :edit }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tag.destroy
    respond_to do |format|
      format.html { redirect_to admin_tags_path
      flash[:success] = 'Le tag a bien été supprimé.' }
      format.json { head :no_content }
    end
  end

  private
    def set_tag
      @tag = Tag.find(params[:id])
    end

    def tag_params
      params.require(:tag).permit(:name)
    end
end
