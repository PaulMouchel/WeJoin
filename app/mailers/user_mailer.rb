class UserMailer < ApplicationMailer
	  default from: 'support.we-join@laposte.net'
	 
	  def welcome_email(user)
	    @user = user 
	    @url  = 'https://wejoin-rennes.herokuapp.com//users/sign_in' 

	    mail(to: @user.email, subject: 'Bienvenue chez nous !') 
	  end

	  def new_place_email(place)
	    @admins = User.where(is_admin: true)
	    @place = place

	    @admins.each do |admin|
	    	mail(to: admin.email, subject: "Un nouveau lieu a été créé : #{@place.name}.")
	    end
	  end

end