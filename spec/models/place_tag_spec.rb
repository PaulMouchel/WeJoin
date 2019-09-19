require 'rails_helper'

RSpec.describe PlaceTag, type: :model do

  before(:each) do 
  	@city = FactoryBot.create(:city, :with_avatar)
  	@place = FactoryBot.create(:place, city: @city)
  	@tag = FactoryBot.create(:tag)
  	@place_tag = FactoryBot.create(:place_tag, place: @place, tag: @tag)
  end

  context "validations" do

    it "is valid with valid attributes" do
    	
      expect(@place_tag).to be_a(PlaceTag)
      expect(@place_tag).to be_valid
    end
  end

  context "associations" do
  	describe "place" do
      it "should have one place" do
        expect(@place_tag.place == @place).to eq(true)
      end
    end
    describe "tag" do
      it "should have one place" do
        expect(@place_tag.tag == @tag).to eq(true)
      end
    end
  end
end