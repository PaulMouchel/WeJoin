require 'rails_helper'

RSpec.describe Attendance, type: :model do

	before(:each) do 
		@city = FactoryBot.create(:city, :with_avatar)
		@user = FactoryBot.create(:user)
  	@place = FactoryBot.create(:place, city: @city)
    @attendance = FactoryBot.create(:attendance, user: @user, place: @place)
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@attendance).to be_a(Attendance)
      expect(@attendance).to be_valid
    end

    describe "#date" do
    	it { expect(@attendance).to validate_presence_of(:date) }
    end
  end

  context "associations" do

    describe "user" do
      it "should have one user" do
        expect(@attendance.user == @user).to eq(true)
      end
    end
    describe "places" do
      it "should have one place" do
        expect(@attendance.place == @place).to eq(true)
      end
    end
  end
end
