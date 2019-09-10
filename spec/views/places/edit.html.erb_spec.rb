require 'rails_helper'

RSpec.describe "places/edit", type: :view do
  before(:each) do
    @place = assign(:place, Place.create!(
      :city => nil,
      :name => "MyString",
      :address => "MyString",
      :description => "MyText",
      :coffee_price => 1.5,
      :tea_price => 1.5,
      :beer_price => 1.5,
      :wifi_password => "MyString"
    ))
  end

  it "renders the edit place form" do
    render

    assert_select "form[action=?][method=?]", place_path(@place), "post" do

      assert_select "input[name=?]", "place[city_id]"

      assert_select "input[name=?]", "place[name]"

      assert_select "input[name=?]", "place[address]"

      assert_select "textarea[name=?]", "place[description]"

      assert_select "input[name=?]", "place[coffee_price]"

      assert_select "input[name=?]", "place[tea_price]"

      assert_select "input[name=?]", "place[beer_price]"

      assert_select "input[name=?]", "place[wifi_password]"
    end
  end
end
