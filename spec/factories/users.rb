FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    encrypted_password { "azerty" }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    description { Faker::TvShows::Simpsons.quote }
    is_admin { false }
    birth_date { Faker::Date.birthday(min_age: 1, max_age: 110) }
    profession { Faker::Job.title }
    user_pic { Faker::Company.logo }
  end
end
