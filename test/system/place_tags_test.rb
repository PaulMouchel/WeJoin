require "application_system_test_case"

class PlaceTagsTest < ApplicationSystemTestCase
  setup do
    @place_tag = place_tags(:one)
  end

  test "visiting the index" do
    visit place_tags_url
    assert_selector "h1", text: "Place Tags"
  end

  test "creating a Place tag" do
    visit place_tags_url
    click_on "New Place Tag"

    click_on "Create Place tag"

    assert_text "Place tag was successfully created"
    click_on "Back"
  end

  test "updating a Place tag" do
    visit place_tags_url
    click_on "Edit", match: :first

    click_on "Update Place tag"

    assert_text "Place tag was successfully updated"
    click_on "Back"
  end

  test "destroying a Place tag" do
    visit place_tags_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Place tag was successfully destroyed"
  end
end
