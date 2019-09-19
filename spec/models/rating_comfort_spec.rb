require 'rails_helper'

RSpec.describe RatingComfort, type: :model do

	before(:each) do 
		@city = FactoryBot.create(:city, :with_avatar)
		@user = FactoryBot.create(:user)
  	@place = FactoryBot.create(:place, city: @city)
    @rating_comfort = FactoryBot.create(:rating_comfort, user: @user, place: @place)
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@rating_comfort).to be_a(RatingComfort)
      expect(@rating_comfort).to be_valid
    end

    describe "#comfort" do
    	it { expect(@rating_comfort).to validate_presence_of(:comforts) }
    	it { expect(@rating_comfort.comforts).to be_between(0, 5) }
    end
  end

  context "associations" do

    describe "user" do
      it "should have one user" do
        expect(@rating_comfort.user == @user).to eq(true)
      end
    end
    describe "places" do
      it "should have one place" do
        expect(@rating_comfort.place == @place).to eq(true)
      end
    end
  end
end
