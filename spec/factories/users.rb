FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    encrypted_password { "azerty" }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    description { Faker::TvShows::Simpsons.quote }
    is_admin { false }
    birth_date { Faker::Date.birthday(min_age: 18, max_age: 75) }
    profession { Faker::Job.title }
    user_pic { Faker::Company.logo }
  end
end
