FactoryBot.define do
  factory :attendance do
  	user { FactoryBot.create(:user) }
  	place { FactoryBot.create(:place)}
    date { Faker::Time.forward(days: 30, period: :morning) }
  end
end
