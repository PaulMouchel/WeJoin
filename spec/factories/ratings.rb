FactoryBot.define do
  factory :rating do
  	user { FactoryBot.create(:user) }
  	place { FactoryBot.create(:place)}
    stars { rand[1..5]}
  end
end
