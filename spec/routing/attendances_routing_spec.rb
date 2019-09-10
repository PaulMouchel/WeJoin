require "rails_helper"

RSpec.describe AttendancesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/users/5/attendances").to route_to("attendances#index", :user_id => "5")
    end

    it "routes to #new" do
      expect(:get => "/users/5/attendances/new").to route_to("attendances#new", :user_id => "5")
    end

    it "routes to #show" do
      expect(:get => "/users/5/attendances/1").to route_to("attendances#show", :id => "1", :user_id => "5")
    end

    it "routes to #edit" do
      expect(:get => "/users/5/attendances/1/edit").to route_to("attendances#edit", :id => "1", :user_id => "5")
    end


    it "routes to #create" do
      expect(:post => "/users/5/attendances").to route_to("attendances#create", :user_id => "5")
    end

    it "routes to #update via PUT" do
      expect(:put => "/users/5/attendances/1").to route_to("attendances#update", :id => "1", :user_id => "5")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/users/5/attendances/1").to route_to("attendances#update", :id => "1", :user_id => "5")
    end

    it "routes to #destroy" do
      expect(:delete => "/users/5/attendances/1").to route_to("attendances#destroy", :id => "1", :user_id => "5")
    end
  end
end
