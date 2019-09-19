FactoryBot.define do
  factory :favorite do
  	user { FactoryBot.create(:user) }
  	favorite_place { FactoryBot.create(:place)}
  end
end
