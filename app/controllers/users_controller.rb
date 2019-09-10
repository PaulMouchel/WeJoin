class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :create, :update]

  def show
    @user = User.all.find(params[:id])
  end
  
  def create
    
  end

  
  def update
    current_user.update(user_params)
      if current_user.save
        flash[:success] = 'You account was successfully updated.'
        redirect_to user_path(current_user.id)
      else
        flash.now[:error] = @order.errors.full_messages.to_sentence
        render :edit
      end
  end
  
  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :description, :age, :user_pic)
    end
end
