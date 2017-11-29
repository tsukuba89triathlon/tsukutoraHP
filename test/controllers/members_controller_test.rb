require 'test_helper'

class MembersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @member = members(:one)
  end

  test "should get index" do
    get members_url
    assert_response :success
  end

  test "should get new" do
    get new_member_url
    assert_response :success
  end

  test "should create member" do
    assert_difference('Member.count') do
      post members_url, params: { member: { a1: @member.a1, a2: @member.a2, a3: @member.a3, a4: @member.a4, a5: @member.a5, belong: @member.belong, bike: @member.bike, goal: @member.goal, grade: @member.grade, hometown: @member.hometown, last: @member.last, name: @member.name, part: @member.part, password: @member.password, q1: @member.q1, q2: @member.q2, q3: @member.q3, s4: @member.s4, s5: @member.s5, school: @member.school, sports: @member.sports, status: @member.status, user_id: @member.user_id } }
    end

    assert_redirected_to member_url(Member.last)
  end

  test "should show member" do
    get member_url(@member)
    assert_response :success
  end

  test "should get edit" do
    get edit_member_url(@member)
    assert_response :success
  end

  test "should update member" do
    patch member_url(@member), params: { member: { a1: @member.a1, a2: @member.a2, a3: @member.a3, a4: @member.a4, a5: @member.a5, belong: @member.belong, bike: @member.bike, goal: @member.goal, grade: @member.grade, hometown: @member.hometown, last: @member.last, name: @member.name, part: @member.part, password: @member.password, q1: @member.q1, q2: @member.q2, q3: @member.q3, s4: @member.s4, s5: @member.s5, school: @member.school, sports: @member.sports, status: @member.status, user_id: @member.user_id } }
    assert_redirected_to member_url(@member)
  end

  test "should destroy member" do
    assert_difference('Member.count', -1) do
      delete member_url(@member)
    end

    assert_redirected_to members_url
  end
end
