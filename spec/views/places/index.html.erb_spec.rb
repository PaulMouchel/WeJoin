require 'rails_helper'

RSpec.describe "places/index", type: :view do
  before(:each) do
    assign(:places, [
      Place.create!(
        :city => nil,
        :name => "Name",
        :address => "Address",
        :description => "MyText",
        :coffee_price => 2.5,
        :tea_price => 3.5,
        :beer_price => 4.5,
        :wifi_password => "Wifi Password"
      ),
      Place.create!(
        :city => nil,
        :name => "Name",
        :address => "Address",
        :description => "MyText",
        :coffee_price => 2.5,
        :tea_price => 3.5,
        :beer_price => 4.5,
        :wifi_password => "Wifi Password"
      )
    ])
  end

  it "renders a list of places" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
    assert_select "tr>td", :text => 4.5.to_s, :count => 2
    assert_select "tr>td", :text => "Wifi Password".to_s, :count => 2
  end
end
