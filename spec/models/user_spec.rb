require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do 
    @user = FactoryBot.create(:user)    
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end

  context "public instance methods" do

    describe "#full_name" do

      it "should return a string" do
        expect(@user.name).to be_a(String)
      end

      it "should return the full name" do
        expect(@user.name).to eq(@user.first_name + " " + @user.last_name)
      end
    end

    describe "#age" do

      it "should return an integer" do
        expect(@user.age).to be_a(Integer)
      end

      it "should be positive" do
        expect(@user.age).to be_between(1, 110)
      end
    end
  end
end
