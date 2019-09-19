FactoryBot.define do
  factory :rating_wifi do
  	user { FactoryBot.create(:user) }
  	place { FactoryBot.create(:place)}
    wifis { rand[1..5]}
  end
end
