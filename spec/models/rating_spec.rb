require 'rails_helper'

RSpec.describe Rating, type: :model do

	before(:each) do 
		@city = FactoryBot.create(:city, :with_avatar)
		@user = FactoryBot.create(:user)
  	@place = FactoryBot.create(:place, city: @city)
    @rating = FactoryBot.create(:rating, user: @user, place: @place)
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@rating).to be_a(Rating)
      expect(@rating).to be_valid
    end

    describe "#stars" do
    	it { expect(@rating).to validate_presence_of(:stars) }
    	it { expect(@rating.stars).to be_between(0, 5) }
    end
  end

  context "associations" do

    describe "user" do
      it "should have one user" do
        expect(@rating.user == @user).to eq(true)
      end
    end
    describe "places" do
      it "should have one place" do
        expect(@rating.place == @place).to eq(true)
      end
    end
  end
end