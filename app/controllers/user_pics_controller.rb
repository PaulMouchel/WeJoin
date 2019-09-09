class UserPicsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @user.user_pic.attach(params[:user_pic])
    redirect_to(user_path(@user))
  end
end
