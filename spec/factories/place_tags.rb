FactoryBot.define do
  factory :place_tag do
  	place { FactoryBot.create(:place)}
    tag { FactoryBot.create(:tag) }
  end
end
