require "rails_helper"

RSpec.describe CitiesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/cities").to route_to("cities#index")
    end

    it "routes to #index" do
      expect(:get => "admin/cities").to route_to("admin/cities#index")
    end

    it "routes to #new" do
      expect(:get => "admin/cities/new").to route_to("admin/cities#new")
    end

    it "routes to #edit" do
      expect(:get => "admin/cities/1/edit").to route_to("admin/cities#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "admin/cities").to route_to("admin/cities#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "admin/cities/1").to route_to("admin/cities#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "admin/cities/1").to route_to("admin/cities#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "admin/cities/1").to route_to("admin/cities#destroy", :id => "1")
    end
  end
end
