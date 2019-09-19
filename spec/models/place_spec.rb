require 'rails_helper'

RSpec.describe Place, type: :model do

  before(:each) do 
  	@city = FactoryBot.create(:city, :with_avatar)
  	@place = FactoryBot.create(:place, city: @city)
  end

  context "validations" do

    it "is valid with valid attributes" do
    	
      expect(@place).to be_a(Place)
      expect(@place).to be_valid
    end

    describe "#name" do
      it { expect(@place).to validate_presence_of(:name) }
    end

    describe "#address" do
      it { expect(@place).to validate_presence_of(:address) }
    end
  end

  context "associations" do

  	describe "attendances" do
      it { expect(@place).to have_many(:attendances) }
    end

    describe "favorites" do
      it { expect(@place).to have_many(:favorites) }
    end

    describe "ratings" do
      it { expect(@place).to have_many(:ratings) }
    end

    describe "rating_outlets" do
      it { expect(@place).to have_many(:rating_outlets) }
    end

    describe "rating_noise_levels" do
      it { expect(@place).to have_many(:rating_noise_levels) }
    end

    describe "rating_wifis" do
      it { expect(@place).to have_many(:rating_wifis) }
    end

    describe "rating_comforts" do
      it { expect(@place).to have_many(:rating_comforts) }
    end

    describe "place_tags" do
      it { expect(@place).to have_many(:place_tags) }
    end

    describe "tags" do
      it { expect(@place).to have_many(:tags) }
    end

    describe "place_editions" do
      it { expect(@place).to have_many(:place_editions) }
    end
  end

  context "public instance methods" do

    describe "#average_rating" do

    	it "should return a float" do
        expect(@place.average_rating).to be_a(Float)
      end

      it "should return the average rating" do
      	user1 = FactoryBot.create(:user)
      	user2 = FactoryBot.create(:user)
      	user1.rate_place(@place, 1).save
      	user2.rate_place(@place, 4).save
        expect(@place.average_rating).to eq(2.5)
      end
    end

    describe "#my_rating" do

    	user1 = FactoryBot.create(:user)

    	it "should return an integer" do
        expect(@place.my_rating(user1)).to be_a(Integer)
      end

      it "should return the user rating" do
      	user2 = FactoryBot.create(:user)
      	user1.rate_place(@place, 1).save
      	user2.rate_place(@place, 4).save
        expect(@place.my_rating(user1)).to eq(1)
        expect(@place.my_rating(user2)).to eq(4)
      end
    end

    describe "#average_rating_outlets" do

    	it "should return a float" do
        expect(@place.average_rating_outlets).to be_a(Float)
      end

      it "should return the average rating" do
      	user1 = FactoryBot.create(:user)
      	user2 = FactoryBot.create(:user)
      	user1.rate_place_outlets(@place, 1).save
      	user2.rate_place_outlets(@place, 4).save
        expect(@place.average_rating_outlets).to eq(2.5)
      end
    end

    describe "#my_rating_outlets" do

    	user1 = FactoryBot.create(:user)

    	it "should return an integer" do
        expect(@place.my_rating_outlets(user1)).to be_a(Integer)
      end

      it "should return the user rating for outlets" do
      	user2 = FactoryBot.create(:user)
      	user1.rate_place_outlets(@place, 1).save
      	user2.rate_place_outlets(@place, 4).save
        expect(@place.my_rating_outlets(user1)).to eq(1)
        expect(@place.my_rating_outlets(user2)).to eq(4)
      end
    end

    describe "#average_rating_noise_levels" do

    	it "should return a float" do
        expect(@place.average_rating_noise_levels).to be_a(Float)
      end

      it "should return the average rating" do
      	user1 = FactoryBot.create(:user)
      	user2 = FactoryBot.create(:user)
      	user1.rate_place_noise_levels(@place, 1).save
      	user2.rate_place_noise_levels(@place, 4).save
        expect(@place.average_rating_noise_levels).to eq(2.5)
      end
    end

    describe "#my_rating_noise_levels" do

    	user1 = FactoryBot.create(:user)

    	it "should return an integer" do
        expect(@place.my_rating_noise_levels(user1)).to be_a(Integer)
      end

      it "should return the user rating for noise_levels" do
      	user2 = FactoryBot.create(:user)
      	user1.rate_place_noise_levels(@place, 1).save
      	user2.rate_place_noise_levels(@place, 4).save
        expect(@place.my_rating_noise_levels(user1)).to eq(1)
        expect(@place.my_rating_noise_levels(user2)).to eq(4)
      end
    end

    describe "#average_rating_wifis" do

    	it "should return a float" do
        expect(@place.average_rating_wifis).to be_a(Float)
      end

      it "should return the average rating" do
      	user1 = FactoryBot.create(:user)
      	user2 = FactoryBot.create(:user)
      	user1.rate_place_wifis(@place, 1).save
      	user2.rate_place_wifis(@place, 4).save
        expect(@place.average_rating_wifis).to eq(2.5)
      end
    end

    describe "#my_rating_wifis" do

    	user1 = FactoryBot.create(:user)

    	it "should return an integer" do
        expect(@place.my_rating_wifis(user1)).to be_a(Integer)
      end

      it "should return the user rating for wifis" do
      	user2 = FactoryBot.create(:user)
      	user1.rate_place_wifis(@place, 1).save
      	user2.rate_place_wifis(@place, 4).save
        expect(@place.my_rating_wifis(user1)).to eq(1)
        expect(@place.my_rating_wifis(user2)).to eq(4)
      end
    end

    describe "#average_rating_comforts" do

    	it "should return a float" do
        expect(@place.average_rating_comforts).to be_a(Float)
      end

      it "should return the average rating" do
      	user1 = FactoryBot.create(:user)
      	user2 = FactoryBot.create(:user)
      	user1.rate_place_comforts(@place, 1).save
      	user2.rate_place_comforts(@place, 4).save
        expect(@place.average_rating_comforts).to eq(2.5)
      end
    end

    describe "#my_rating_comforts" do

    	user1 = FactoryBot.create(:user)

    	it "should return an integer" do
        expect(@place.my_rating_comforts(user1)).to be_a(Integer)
      end

      it "should return the user rating for comforts" do
      	user2 = FactoryBot.create(:user)
      	user1.rate_place_comforts(@place, 1).save
      	user2.rate_place_comforts(@place, 4).save
        expect(@place.my_rating_comforts(user1)).to eq(1)
        expect(@place.my_rating_comforts(user2)).to eq(4)
      end
    end

    describe "#is_favorite?" do

    	user = FactoryBot.create(:user)

    	it "should return a boolean" do
        expect(@place.is_favorite?(user)).to be_in([true, false])
      end
    end
  end
end