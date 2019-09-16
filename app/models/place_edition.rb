class PlaceEdition < ApplicationRecord

	after_create :edit_place_send

  	has_many_attached :place_pics

  	belongs_to :place

  	def edit_place_send
		UserMailer.edit_place_email(self).deliver_now
	end

end
