require 'rails_helper'

RSpec.describe "ratings/edit", type: :view do
  before(:each) do
    @rating = assign(:rating, Rating.create!(
      :user => nil,
      :place => nil,
      :stars => 1
    ))
  end

  it "renders the edit rating form" do
    render

    assert_select "form[action=?][method=?]", rating_path(@rating), "post" do

      assert_select "input[name=?]", "rating[user_id]"

      assert_select "input[name=?]", "rating[place_id]"

      assert_select "input[name=?]", "rating[stars]"
    end
  end
end
