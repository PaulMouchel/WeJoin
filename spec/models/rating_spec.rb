require 'rails_helper'

RSpec.describe Rating, type: :model do

	before(:each) do 
		city = City.create(name: "MyCity")
		user = User.create(city: city, email:"john.doe@yopmail.com", password:"azerty", password_confirmation:"azerty")
		place = Place.create(city: city, name:"ma place", address:"9 boulevard de la liberté 35000 RENNES")
    @rating = Rating.create(user: user, place: place, stars: 3)
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@rating).to be_a(Rating)
      expect(@rating).to be_valid
    end

    describe "#stars" do
      it "should not be valid without stars" do
        bad_rating = Rating.create(user: user, place: place)
        expect(bad_rating).not_to be_valid
        expect(bad_rating.errors.include?(:stars)).to eq(true)
      end
    end

    describe "#user" do
      it "should not be valid without user" do
        bad_rating = Rating.create(place: place, stars: 3)
        expect(bad_rating).not_to be_valid
        expect(bad_rating.errors.include?(:user)).to eq(true)
      end
    end

    describe "#user" do
      it "should not be valid without place" do
        bad_rating = Rating.create(user: user, stars: 3)
        expect(bad_rating).not_to be_valid
        expect(bad_rating.errors.include?(:place)).to eq(true)
      end
    end
  end

  context "associations" do

    describe "user" do
      it "should have one user" do
        expect(@rating.user == user).to eq(true)
      end
    end
    describe "places" do
      it "should have one place" do
        expect(@rating.place == place).to eq(true)
      end
    end
  end

end
