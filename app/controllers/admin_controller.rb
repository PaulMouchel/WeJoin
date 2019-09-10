class AdminController < ApplicationController
	before_action :authenticate_user!
	before_action :check_if_admin

	private

  def check_if_admin
    redirect_to cities_path if !current_user.is_admin
  end
end