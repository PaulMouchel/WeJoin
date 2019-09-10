require 'rails_helper'

RSpec.describe "place_tags/new", type: :view do
  before(:each) do
    assign(:place_tag, PlaceTag.new(
      :place => nil,
      :tag => nil
    ))
  end

  it "renders new place_tag form" do
    render

    assert_select "form[action=?][method=?]", place_tags_path, "post" do

      assert_select "input[name=?]", "place_tag[place_id]"

      assert_select "input[name=?]", "place_tag[tag_id]"
    end
  end
end
