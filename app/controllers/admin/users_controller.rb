class Admin::UsersController < AdminController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all.sort_by{ |user| user.email.upcase}
  end

  def show
    @user = User.all.find(params[:id])
  end
  
  def update
    @user.update(user_params)
      if @user.save
        flash[:success] = 'Le compte utilisateur a bien été modifié !'
        redirect_to admin_user_path(@user.id)
      else
        flash.now[:error] = @user.errors.full_messages.to_sentence
        render :edit
      end
  end

  def destroy
    @user.destroy
    @user.user_pic.purge
    redirect_to admin_users_path 
    flash[:success] = 'Le compte utilisateur a bien été supprimé.'
  end
  
  private
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :description, :birth_date, :user_pic, :is_admin)
  end

  def set_user
    @user = User.find(params[:id])
  end
end