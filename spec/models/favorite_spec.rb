require 'rails_helper'

RSpec.describe Favorite, type: :model do

	before(:each) do 
		@city = FactoryBot.create(:city, :with_avatar)
		@user = FactoryBot.create(:user)
  	@place = FactoryBot.create(:place, city: @city)
    @favorite = FactoryBot.create(:favorite, user: @user, favorite_place: @place)
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@favorite).to be_a(Favorite)
      expect(@favorite).to be_valid
    end
  end

  context "associations" do

    describe "user" do
      it "should have one user" do
        expect(@favorite.user == @user).to eq(true)
      end
    end
    describe "places" do
      it "should have one favorite place" do
        expect(@favorite.favorite_place == @place).to eq(true)
      end
    end
  end
end