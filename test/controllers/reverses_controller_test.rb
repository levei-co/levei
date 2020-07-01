require 'test_helper'

class ReversesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reverse = reverses(:one)
  end

  test "should get index" do
    get reverses_url
    assert_response :success
  end

  test "should get new" do
    get new_reverse_url
    assert_response :success
  end

  test "should create reverse" do
    assert_difference('Reverse.count') do
      post reverses_url, params: { reverse: { order_id: @reverse.order_id, reason: @reverse.reason, status: @reverse.status, user_id: @reverse.user_id } }
    end

    assert_redirected_to reverse_url(Reverse.last)
  end

  test "should show reverse" do
    get reverse_url(@reverse)
    assert_response :success
  end

  test "should get edit" do
    get edit_reverse_url(@reverse)
    assert_response :success
  end

  test "should update reverse" do
    patch reverse_url(@reverse), params: { reverse: { order_id: @reverse.order_id, reason: @reverse.reason, status: @reverse.status, user_id: @reverse.user_id } }
    assert_redirected_to reverse_url(@reverse)
  end

  test "should destroy reverse" do
    assert_difference('Reverse.count', -1) do
      delete reverse_url(@reverse)
    end

    assert_redirected_to reverses_url
  end
end
