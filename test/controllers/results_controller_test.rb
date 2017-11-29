require 'test_helper'

class ResultsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @result = results(:one)
  end

  test "should get index" do
    get results_url
    assert_response :success
  end

  test "should get new" do
    get new_result_url
    assert_response :success
  end

  test "should create result" do
    assert_difference('Result.count') do
      post results_url, params: { result: { b_rank: @result.b_rank, b_time: @result.b_time, date: @result.date, division: @result.division, dnf: @result.dnf, dns: @result.dns, game: @result.game, name: @result.name, r_rank: @result.r_rank, r_time: @result.r_time, remarks: @result.remarks, s_rank: @result.s_rank, s_time: @result.s_time, split: @result.split, split_time: @result.split_time, total_rank: @result.total_rank, total_time: @result.total_time } }
    end

    assert_redirected_to result_url(Result.last)
  end

  test "should show result" do
    get result_url(@result)
    assert_response :success
  end

  test "should get edit" do
    get edit_result_url(@result)
    assert_response :success
  end

  test "should update result" do
    patch result_url(@result), params: { result: { b_rank: @result.b_rank, b_time: @result.b_time, date: @result.date, division: @result.division, dnf: @result.dnf, dns: @result.dns, game: @result.game, name: @result.name, r_rank: @result.r_rank, r_time: @result.r_time, remarks: @result.remarks, s_rank: @result.s_rank, s_time: @result.s_time, split: @result.split, split_time: @result.split_time, total_rank: @result.total_rank, total_time: @result.total_time } }
    assert_redirected_to result_url(@result)
  end

  test "should destroy result" do
    assert_difference('Result.count', -1) do
      delete result_url(@result)
    end

    assert_redirected_to results_url
  end
end
