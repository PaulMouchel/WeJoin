FactoryBot.define do
  factory :place do
    name { Faker::Address.city }
    address { Faker::Address.full_address }
    city { FactoryBot.create(:city)}
  end
end