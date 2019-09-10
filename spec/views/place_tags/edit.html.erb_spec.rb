require 'rails_helper'

RSpec.describe "place_tags/edit", type: :view do
  before(:each) do
    @place_tag = assign(:place_tag, PlaceTag.create!(
      :place => nil,
      :tag => nil
    ))
  end

  it "renders the edit place_tag form" do
    render

    assert_select "form[action=?][method=?]", place_tag_path(@place_tag), "post" do

      assert_select "input[name=?]", "place_tag[place_id]"

      assert_select "input[name=?]", "place_tag[tag_id]"
    end
  end
end
