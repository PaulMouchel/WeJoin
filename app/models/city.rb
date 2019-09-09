class City < ApplicationRecord
	validates name,
		presence: true
	validates :zip_code, 
  	presence: true, 
    uniqueness: true,
    format: { with: /\A(([0-8][0-9])|(9[0-5])|(2[ab]))[0-9]{3}\z/, message: "Please enter a valid french zip code" }

	has_many: users
	has_many: places, dependant: destroy
end
