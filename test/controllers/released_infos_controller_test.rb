require 'test_helper'

class ReleasedInfosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @released_info = released_infos(:one)
  end

  test "should get index" do
    get released_infos_url
    assert_response :success
  end

  test "should get new" do
    get new_released_info_url
    assert_response :success
  end

  test "should create released_info" do
    assert_difference('ReleasedInfo.count') do
      post released_infos_url, params: { released_info: { body: @released_info.body, date: @released_info.date } }
    end

    assert_redirected_to released_info_url(ReleasedInfo.last)
  end

  test "should show released_info" do
    get released_info_url(@released_info)
    assert_response :success
  end

  test "should get edit" do
    get edit_released_info_url(@released_info)
    assert_response :success
  end

  test "should update released_info" do
    patch released_info_url(@released_info), params: { released_info: { body: @released_info.body, date: @released_info.date } }
    assert_redirected_to released_info_url(@released_info)
  end

  test "should destroy released_info" do
    assert_difference('ReleasedInfo.count', -1) do
      delete released_info_url(@released_info)
    end

    assert_redirected_to released_infos_url
  end
end
