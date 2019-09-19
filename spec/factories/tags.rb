FactoryBot.define do
  factory :tag do
    name { Faker::Beer.brand }
  end
end
