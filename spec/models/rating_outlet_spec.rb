require 'rails_helper'

RSpec.describe RatingOutlet, type: :model do

	before(:each) do 
		@city = FactoryBot.create(:city, :with_avatar)
		@user = FactoryBot.create(:user)
  	@place = FactoryBot.create(:place, city: @city)
    @ratingOutlet = FactoryBot.create(:rating_outlet, user: @user, place: @place)
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@ratingOutlet).to be_a(RatingOutlet)
      expect(@ratingOutlet).to be_valid
    end

    describe "#outlets" do
    	it { expect(@ratingOutlet).to validate_presence_of(:outlets) }
    	it { expect(@ratingOutlet.outlets).to be_between(0, 5) }
    end
  end

  context "associations" do

    describe "user" do
      it "should have one user" do
        expect(@ratingOutlet.user == @user).to eq(true)
      end
    end
    describe "places" do
      it "should have one place" do
        expect(@ratingOutlet.place == @place).to eq(true)
      end
    end
  end
end