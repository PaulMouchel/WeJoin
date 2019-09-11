require "rails_helper"

RSpec.describe FavoritesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/users/5/favorites").to route_to("favorites#index", :user_id => "5")
    end

    it "routes to #new" do
      expect(:get => "/users/5/favorites/new").to route_to("favorites#new", :user_id => "5")
    end

    it "routes to #edit" do
      expect(:get => "/users/5/favorites/1/edit").to route_to("favorites#edit", :id => "1", :user_id => "5")
    end


    it "routes to #create" do
      expect(:post => "/users/5/favorites").to route_to("favorites#create", :user_id => "5")
    end

    it "routes to #update via PUT" do
      expect(:put => "/users/5/favorites/1").to route_to("favorites#update", :id => "1", :user_id => "5")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/users/5/favorites/1").to route_to("favorites#update", :id => "1", :user_id => "5")
    end

    it "routes to #destroy" do
      expect(:delete => "/users/5/favorites/1").to route_to("favorites#destroy", :id => "1", :user_id => "5")
    end
  end
end
