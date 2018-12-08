require 'test_helper'

class SessionsControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get sessions_controller_new_url
    assert_response :success
  end

  test "should get edit" do
    get sessions_controller_edit_url
    assert_response :success
  end

  test "should get update" do
    get sessions_controller_update_url
    assert_response :success
  end

  test "should get delete" do
    get sessions_controller_delete_url
    assert_response :success
  end

end
