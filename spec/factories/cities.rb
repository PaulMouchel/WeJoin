FactoryBot.define do
  factory :city do
    name { Faker::Address.city }
    
    trait :with_avatar do
      city_pic { fixture_file_upload(Rails.root.join('spec', 'support', 'assets', 'test-image.jpg'), 'image/jpg') }
    end
  end
end

