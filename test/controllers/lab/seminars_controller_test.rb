require 'test_helper'

class Lab::SeminarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lab_seminar = lab_seminars(:one)
  end

  test "should get index" do
    get lab_seminars_url
    assert_response :success
  end

  test "should get new" do
    get new_lab_seminar_url
    assert_response :success
  end

  test "should create lab_seminar" do
    assert_difference('Lab::Seminar.count') do
      post lab_seminars_url, params: { lab_seminar: {  } }
    end

    assert_redirected_to lab_seminar_url(Lab::Seminar.last)
  end

  test "should show lab_seminar" do
    get lab_seminar_url(@lab_seminar)
    assert_response :success
  end

  test "should get edit" do
    get edit_lab_seminar_url(@lab_seminar)
    assert_response :success
  end

  test "should update lab_seminar" do
    patch lab_seminar_url(@lab_seminar), params: { lab_seminar: {  } }
    assert_redirected_to lab_seminar_url(@lab_seminar)
  end

  test "should destroy lab_seminar" do
    assert_difference('Lab::Seminar.count', -1) do
      delete lab_seminar_url(@lab_seminar)
    end

    assert_redirected_to lab_seminars_url
  end
end
