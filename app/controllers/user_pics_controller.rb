class UserPicsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @user.user_pic.attach(params[:user_pic])
    redirect_to(user_path(@user))
  end

  def destroy
    @user = User.find(params[:user_id])
    @user.user_pic.purge
    redirect_to(user_path(@user))
  end
end
