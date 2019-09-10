require 'rails_helper'

RSpec.describe "places/show", type: :view do
  before(:each) do
    @place = assign(:place, Place.create!(
      :city => nil,
      :name => "Name",
      :address => "Address",
      :description => "MyText",
      :coffee_price => 2.5,
      :tea_price => 3.5,
      :beer_price => 4.5,
      :wifi_password => "Wifi Password"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3.5/)
    expect(rendered).to match(/4.5/)
    expect(rendered).to match(/Wifi Password/)
  end
end
