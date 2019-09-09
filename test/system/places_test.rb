require "application_system_test_case"

class PlacesTest < ApplicationSystemTestCase
  setup do
    @place = places(:one)
  end

  test "visiting the index" do
    visit places_url
    assert_selector "h1", text: "Places"
  end

  test "creating a Place" do
    visit places_url
    click_on "New Place"

    fill_in "Address", with: @place.address
    fill_in "Beer price", with: @place.beer_price
    fill_in "Coffee price", with: @place.coffee_price
    fill_in "Description", with: @place.description
    fill_in "Name", with: @place.name
    fill_in "Tea price", with: @place.tea_price
    fill_in "Wifi password", with: @place.wifi_password
    click_on "Create Place"

    assert_text "Place was successfully created"
    click_on "Back"
  end

  test "updating a Place" do
    visit places_url
    click_on "Edit", match: :first

    fill_in "Address", with: @place.address
    fill_in "Beer price", with: @place.beer_price
    fill_in "Coffee price", with: @place.coffee_price
    fill_in "Description", with: @place.description
    fill_in "Name", with: @place.name
    fill_in "Tea price", with: @place.tea_price
    fill_in "Wifi password", with: @place.wifi_password
    click_on "Update Place"

    assert_text "Place was successfully updated"
    click_on "Back"
  end

  test "destroying a Place" do
    visit places_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Place was successfully destroyed"
  end
end
