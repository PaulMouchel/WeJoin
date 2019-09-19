require 'rails_helper'

RSpec.describe RatingNoiseLevel, type: :model do

	before(:each) do 
		@city = FactoryBot.create(:city, :with_avatar)
		@user = FactoryBot.create(:user)
  	@place = FactoryBot.create(:place, city: @city)
    @rating_noise_level = FactoryBot.create(:rating_noise_level, user: @user, place: @place)
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@rating_noise_level).to be_a(RatingNoiseLevel)
      expect(@rating_noise_level).to be_valid
    end

    describe "#noise_level" do
    	it { expect(@rating_noise_level).to validate_presence_of(:noise_levels) }
    	it { expect(@rating_noise_level.noise_levels).to be_between(0, 5) }
    end
  end

  context "associations" do

    describe "user" do
      it "should have one user" do
        expect(@rating_noise_level.user == @user).to eq(true)
      end
    end
    describe "places" do
      it "should have one place" do
        expect(@rating_noise_level.place == @place).to eq(true)
      end
    end
  end
end