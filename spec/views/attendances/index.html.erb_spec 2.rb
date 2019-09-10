require 'rails_helper'

RSpec.describe "attendances/index", type: :view do
  before(:each) do
    assign(:attendances, [
      Attendance.create!(
        :user => nil,
        :place => nil
      ),
      Attendance.create!(
        :user => nil,
        :place => nil
      )
    ])
  end

  it "renders a list of attendances" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
