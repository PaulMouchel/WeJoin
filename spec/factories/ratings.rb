FactoryBot.define do
  factory :rating do
  	user { FactoryBot.create(:user) }
  	place { FactoryBot.create(:place, city: FactoryBot.create(:city, :with_avatar))}
    stars { rand(1..5)}
  end
end
