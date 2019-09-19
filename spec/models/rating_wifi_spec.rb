require 'rails_helper'

RSpec.describe RatingWifi, type: :model do

	before(:each) do 
		@city = FactoryBot.create(:city, :with_avatar)
		@user = FactoryBot.create(:user)
  	@place = FactoryBot.create(:place, city: @city)
    @rating_wifi = FactoryBot.create(:rating_wifi, user: @user, place: @place)
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@rating_wifi).to be_a(RatingWifi)
      expect(@rating_wifi).to be_valid
    end

    describe "#wifis" do
    	it { expect(@rating_wifi).to validate_presence_of(:wifis) }
    	it { expect(@rating_wifi.wifis).to be_between(0, 5) }
    end
  end

  context "associations" do

    describe "user" do
      it "should have one user" do
        expect(@rating_wifi.user == @user).to eq(true)
      end
    end
    describe "places" do
      it "should have one place" do
        expect(@rating_wifi.place == @place).to eq(true)
      end
    end
  end
end
