FactoryBot.define do
  factory :rating_comfort do
  	user { FactoryBot.create(:user) }
  	place { FactoryBot.create(:place)}
    comforts { rand(1..5)}
  end
end
