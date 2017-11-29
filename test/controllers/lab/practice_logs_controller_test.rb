require 'test_helper'

class Lab::PracticeLogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lab_practice_log = lab_practice_logs(:one)
  end

  test "should get index" do
    get lab_practice_logs_url
    assert_response :success
  end

  test "should get new" do
    get new_lab_practice_log_url
    assert_response :success
  end

  test "should create lab_practice_log" do
    assert_difference('Lab::PracticeLog.count') do
      post lab_practice_logs_url, params: { lab_practice_log: { bike: @lab_practice_log.bike, date: @lab_practice_log.date, member: @lab_practice_log.member, run: @lab_practice_log.run, swim: @lab_practice_log.swim } }
    end

    assert_redirected_to lab_practice_log_url(Lab::PracticeLog.last)
  end

  test "should show lab_practice_log" do
    get lab_practice_log_url(@lab_practice_log)
    assert_response :success
  end

  test "should get edit" do
    get edit_lab_practice_log_url(@lab_practice_log)
    assert_response :success
  end

  test "should update lab_practice_log" do
    patch lab_practice_log_url(@lab_practice_log), params: { lab_practice_log: { bike: @lab_practice_log.bike, date: @lab_practice_log.date, member: @lab_practice_log.member, run: @lab_practice_log.run, swim: @lab_practice_log.swim } }
    assert_redirected_to lab_practice_log_url(@lab_practice_log)
  end

  test "should destroy lab_practice_log" do
    assert_difference('Lab::PracticeLog.count', -1) do
      delete lab_practice_log_url(@lab_practice_log)
    end

    assert_redirected_to lab_practice_logs_url
  end
end
