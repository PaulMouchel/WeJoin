require 'rails_helper'

RSpec.describe RatingOutlet, type: :model do

	before(:each) do 
		@city = FactoryBot.create(:city, :with_avatar)
		@user = FactoryBot.create(:user)
  	@place = FactoryBot.create(:place, city: @city)
    @rating_outlet = FactoryBot.create(:rating_outlet, user: @user, place: @place)
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@rating_outlet).to be_a(RatingOutlet)
      expect(@rating_outlet).to be_valid
    end

    describe "#outlets" do
    	it { expect(@rating_outlet).to validate_presence_of(:outlets) }
    	it { expect(@rating_outlet.outlets).to be_between(0, 5) }
    end
  end

  context "associations" do

    describe "user" do
      it "should have one user" do
        expect(@rating_outlet.user == @user).to eq(true)
      end
    end
    describe "places" do
      it "should have one place" do
        expect(@rating_outlet.place == @place).to eq(true)
      end
    end
  end
end