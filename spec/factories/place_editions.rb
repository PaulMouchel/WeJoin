FactoryBot.define do
  factory :place_edition do
  	place { FactoryBot.create(:place)}
  end
end
