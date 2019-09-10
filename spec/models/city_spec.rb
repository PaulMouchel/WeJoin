require 'rails_helper'

RSpec.describe City, type: :model do
  
	before(:each) do 
    @city = City.create(name: "MyCity")
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@city).to be_a(City)
      expect(@city).to be_valid
    end

    describe "#name" do
      it "should not be valid without name" do
        bad_city = City.create()
        expect(bad_city).not_to be_valid
        expect(bad_city.errors.include?(:name)).to eq(true)
      end
    end
  end

  context "associations" do

    describe "users" do
      it "should have_many users" do
        user = User.create(city: @city, name:"ma place" address:"9 boulevard de la liberté 35000 RENNES")
        expect(@city.users.include?(user)).to eq(true)
      end
    end
    describe "places" do
      it "should have_many places" do
        place = Place.create(city: @city, email:"john.doe@yopmail.com" password:"azerty", password_confirmation:"azerty")
        expect(@city.places.include?(place)).to eq(true)
      end
    end
  end
end