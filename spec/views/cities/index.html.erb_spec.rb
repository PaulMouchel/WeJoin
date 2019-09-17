require 'rails_helper'

RSpec.describe "cities/index", type: :view do
	context 'it says RENNES' do
	  it "displays 'RENNES'" do

	    render

	    expect(rendered).to have_content 'EXPLORER'
	  end
	end
end