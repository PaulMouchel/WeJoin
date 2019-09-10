require 'rails_helper'

RSpec.describe "place_tags/index", type: :view do
  before(:each) do
    assign(:place_tags, [
      PlaceTag.create!(
        :place => nil,
        :tag => nil
      ),
      PlaceTag.create!(
        :place => nil,
        :tag => nil
      )
    ])
  end

  it "renders a list of place_tags" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
