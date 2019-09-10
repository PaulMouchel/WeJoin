require 'rails_helper'

RSpec.describe "PlaceTags", type: :request do
  describe "GET /place_tags" do
    it "works! (now write some real specs)" do
      get place_tags_path
      expect(response).to have_http_status(200)
    end
  end
end
