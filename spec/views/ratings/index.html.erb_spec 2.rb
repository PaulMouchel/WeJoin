require 'rails_helper'

RSpec.describe "ratings/index", type: :view do
  before(:each) do
    assign(:ratings, [
      Rating.create!(
        :user => nil,
        :place => nil,
        :stars => 2
      ),
      Rating.create!(
        :user => nil,
        :place => nil,
        :stars => 2
      )
    ])
  end

  it "renders a list of ratings" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
