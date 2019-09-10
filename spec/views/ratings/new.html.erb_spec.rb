require 'rails_helper'

RSpec.describe "ratings/new", type: :view do
  before(:each) do
    assign(:rating, Rating.new(
      :user => nil,
      :place => nil,
      :stars => 1
    ))
  end

  it "renders new rating form" do
    render

    assert_select "form[action=?][method=?]", ratings_path, "post" do

      assert_select "input[name=?]", "rating[user_id]"

      assert_select "input[name=?]", "rating[place_id]"

      assert_select "input[name=?]", "rating[stars]"
    end
  end
end
