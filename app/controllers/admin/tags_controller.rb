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
    if @tag.save
      redirect_to admin_tags_path 
      flash[:success] = 'Le tag a bien été créé !' 
    else
      flash.now[:error] = @tag.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    if @tag.update(tag_params)
      redirect_to admin_tags_path 
      flash[:success] = 'Le tag a bien été modifié.'
    else
      flash.now[:error] = @tag.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @tag.destroy
    redirect_to admin_tags_path
    flash[:success] = 'Le tag a bien été supprimé.'
  end

  private
    def set_tag
      @tag = Tag.find(params[:id])
    end

    def tag_params
      params.require(:tag).permit(:name)
    end
end
