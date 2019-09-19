require 'rails_helper'

RSpec.describe Tag, type: :model do

  before(:each) do 
  	@tag = FactoryBot.create(:tag)
  end

  context "validations" do

    it "is valid with valid attributes" do
    	
      expect(@tag).to be_a(Tag)
      expect(@tag).to be_valid
    end

    describe "#name" do
      it { expect(@tag).to validate_presence_of(:name) }
    end
  end

  context "associations" do

  	describe "place_tags" do
      it { expect(@tag).to have_many(:place_tags) }
    end

    describe "place_edition_tags" do
      it { expect(@tag).to have_many(:place_edition_tags) }
    end

    describe "places" do
      it { expect(@tag).to have_many(:places) }
    end
  end
end