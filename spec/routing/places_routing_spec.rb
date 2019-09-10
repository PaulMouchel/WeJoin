require "rails_helper"

RSpec.describe PlacesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/cities/5/places").to route_to("places#index", :city_id => "5")
    end

    it "routes to #new" do
      expect(:get => "/cities/5/places/new").to route_to("places#new", :city_id => "5")
    end

    it "routes to #show" do
      expect(:get => "/cities/5/places/1").to route_to("places#show", :id => "1", :city_id => "5")
    end

    it "routes to #edit" do
      expect(:get => "/cities/5/places/1/edit").to route_to("places#edit", :id => "1", :city_id => "5")
    end


    it "routes to #create" do
      expect(:post => "/cities/5/places").to route_to("places#create", :city_id => "5")
    end

    it "routes to #update via PUT" do
      expect(:put => "/cities/5/places/1").to route_to("places#update", :id => "1", :city_id => "5")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/cities/5/places/1").to route_to("places#update", :id => "1", :city_id => "5")
    end

    it "routes to #destroy" do
      expect(:delete => "/cities/5/places/1").to route_to("places#destroy", :id => "1", :city_id => "5")
    end
  end
end
