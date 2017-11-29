require 'test_helper'

class ImageTargetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @image_target = image_targets(:one)
  end

  test "should get index" do
    get image_targets_url
    assert_response :success
  end

  test "should get new" do
    get new_image_target_url
    assert_response :success
  end

  test "should create image_target" do
    assert_difference('ImageTarget.count') do
      post image_targets_url, params: { image_target: { target: @image_target.target } }
    end

    assert_redirected_to image_target_url(ImageTarget.last)
  end

  test "should show image_target" do
    get image_target_url(@image_target)
    assert_response :success
  end

  test "should get edit" do
    get edit_image_target_url(@image_target)
    assert_response :success
  end

  test "should update image_target" do
    patch image_target_url(@image_target), params: { image_target: { target: @image_target.target } }
    assert_redirected_to image_target_url(@image_target)
  end

  test "should destroy image_target" do
    assert_difference('ImageTarget.count', -1) do
      delete image_target_url(@image_target)
    end

    assert_redirected_to image_targets_url
  end
end
