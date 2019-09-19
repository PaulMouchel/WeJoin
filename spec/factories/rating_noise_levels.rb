FactoryBot.define do
  factory :rating_noise_level do
  	user { FactoryBot.create(:user) }
  	place { FactoryBot.create(:place)}
    noise_levels { rand(1..5)}
  end
end
