FactoryBot.define do
  factory :rating_outlet do
  	user { FactoryBot.create(:user) }
  	place { FactoryBot.create(:place)}
    outlets { rand(1..5)}
  end
end
