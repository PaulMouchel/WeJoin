FactoryBot.define do
  factory :city do
    name { Faker::Address.city }
    city_pic { Faker::Company.logo }
  end
end
