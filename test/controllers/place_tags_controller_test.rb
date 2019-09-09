require 'test_helper'

class PlaceTagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @place_tag = place_tags(:one)
  end

  test "should get index" do
    get place_tags_url
    assert_response :success
  end

  test "should get new" do
    get new_place_tag_url
    assert_response :success
  end

  test "should create place_tag" do
    assert_difference('PlaceTag.count') do
      post place_tags_url, params: { place_tag: {  } }
    end

    assert_redirected_to place_tag_url(PlaceTag.last)
  end

  test "should show place_tag" do
    get place_tag_url(@place_tag)
    assert_response :success
  end

  test "should get edit" do
    get edit_place_tag_url(@place_tag)
    assert_response :success
  end

  test "should update place_tag" do
    patch place_tag_url(@place_tag), params: { place_tag: {  } }
    assert_redirected_to place_tag_url(@place_tag)
  end

  test "should destroy place_tag" do
    assert_difference('PlaceTag.count', -1) do
      delete place_tag_url(@place_tag)
    end

    assert_redirected_to place_tags_url
  end
end
