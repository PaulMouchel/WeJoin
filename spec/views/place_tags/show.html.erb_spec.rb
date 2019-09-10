require 'rails_helper'

RSpec.describe "place_tags/show", type: :view do
  before(:each) do
    @place_tag = assign(:place_tag, PlaceTag.create!(
      :place => nil,
      :tag => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
