require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @user = users(:one)
  end

  test "should get new" do
    get root_url
    assert_response :success
  end

  test "should let user login" do
    post sessions_create_path, params: { session: { email: @user.email, password: 'testing' } }
    assert_redirected_to accounts_path
    assert_equal @user.id, session[:user_id]
  end

  test 'should logout user' do
    delete sessions_destroy_url
    assert_redirected_to root_path
    assert_nil session[:user_id]
  end


end
