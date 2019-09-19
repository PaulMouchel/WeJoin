require 'rails_helper'

RSpec.describe PlaceEdition, type: :model do

  before(:each) do 
  	@city = FactoryBot.create(:city, :with_avatar)
  	@place = FactoryBot.create(:place, city: @city)
  	@place_edition = FactoryBot.create(:place_edition, place: @place)
  end

  context "validations" do

    it "is valid with valid attributes" do
    	
      expect(@place_edition).to be_a(PlaceEdition)
      expect(@place_edition).to be_valid
    end
  end

  context "associations" do

  	describe "place_edition_tags" do
      it { expect(@place_edition).to have_many(:place_edition_tags) }
    end

    describe "tags" do
      it { expect(@place_edition).to have_many(:tags) }
    end

    describe "place" do
      it "should have one place" do
        expect(@place_edition.place == @place).to eq(true)
      end
    end
  end
end