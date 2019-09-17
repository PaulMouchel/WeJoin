class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :create, :update]
  before_action :set_user, only: [:show, :edit, :update]
  
  def update
    current_user.update(user_params)
      if current_user.save
        flash[:success] = 'Ton compte a bien été modifié ! :)'
        redirect_to user_path(current_user.id)
      else
        flash.now[:error] = current_user.errors.full_messages.to_sentence
        render :edit
      end
  end
  
  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :description, :birth_date, :user_pic, :city_id, :profession)
    end
    
    def set_user
      @user = User.all.find(params[:id])
    end
end
