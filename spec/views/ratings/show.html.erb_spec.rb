require 'rails_helper'

RSpec.describe "ratings/show", type: :view do
  before(:each) do
    @rating = assign(:rating, Rating.create!(
      :user => nil,
      :place => nil,
      :stars => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
  end
end
