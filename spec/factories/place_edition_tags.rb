FactoryBot.define do
  factory :place_edition_tag do
  	place_edition { FactoryBot.create(:place_edition)}
    tag { FactoryBot.create(:tag) }
  end
end
