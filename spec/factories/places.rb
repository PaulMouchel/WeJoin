FactoryBot.define do
  factory :places do
    name { Faker::Address.city }
    address { Faker::Address.full_address }
    city_pic { Faker::Company.logo }
    city { FactoryBot.create(:city)}
  end
end