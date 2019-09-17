class PlaceEdition < ApplicationRecord

	after_create :edit_place_send

	has_many_attached :place_pics

	belongs_to :place
	has_many :place_edition_tags, dependent: :destroy
	has_many :tags, through: :place_edition_tags

	def edit_place_send
		UserMailer.edit_place_email(self).deliver_now
	end

	def all_tags=(names)
		names.delete("")
	  self.tags = names.map {|name| Tag.where(name: name.strip).first} - [nil]
	end

	def all_tags
	  self.tags.map(&:name).join(", ")
	end

end
