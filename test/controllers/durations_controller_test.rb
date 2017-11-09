require 'test_helper'

class DurationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @duration = durations(:one)
  end

  test "should get index" do
    get durations_url
    assert_response :success
  end

  test "should get new" do
    get new_duration_url
    assert_response :success
  end

  test "should create duration" do
    assert_difference('Duration.count') do
      post durations_url, params: { duration: { duration_type: @duration.duration_type, first_date: @duration.first_date, last_date: @duration.last_date, leave_request_id: @duration.leave_request_id } }
    end

    assert_redirected_to duration_url(Duration.last)
  end

  test "should show duration" do
    get duration_url(@duration)
    assert_response :success
  end

  test "should get edit" do
    get edit_duration_url(@duration)
    assert_response :success
  end

  test "should update duration" do
    patch duration_url(@duration), params: { duration: { duration_type: @duration.duration_type, first_date: @duration.first_date, last_date: @duration.last_date, leave_request_id: @duration.leave_request_id } }
    assert_redirected_to duration_url(@duration)
  end

  test "should destroy duration" do
    assert_difference('Duration.count', -1) do
      delete duration_url(@duration)
    end

    assert_redirected_to durations_url
  end
end
