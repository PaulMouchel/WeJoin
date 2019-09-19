require 'rails_helper'

RSpec.describe PlaceEditionTag, type: :model do

  before(:each) do 
  	@city = FactoryBot.create(:city, :with_avatar)
  	@place = FactoryBot.create(:place, city: @city)
  	@place_edition = FactoryBot.create(:place_edition, place: @place)
  	@tag = FactoryBot.create(:tag)
  	@place_edition_tag = FactoryBot.create(:place_edition_tag, place_edition: @place_edition, tag: @tag)
  end

  context "validations" do

    it "is valid with valid attributes" do
    	
      expect(@place_edition_tag).to be_a(PlaceEditionTag)
      expect(@place_edition_tag).to be_valid
    end
  end

  context "associations" do
  	describe "place_edition" do
      it "should have one place edition" do
        expect(@place_edition_tag.place_edition == @place_edition).to eq(true)
      end
    end
    describe "tag" do
      it "should have one place" do
        expect(@place_edition_tag.tag == @tag).to eq(true)
      end
    end
  end
end