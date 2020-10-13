require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { email: 'alex@gmail.com', name: 'alex', password: 'testing', password_confirmation: 'testing' } }
    end

    assert_redirected_to accounts_url
  end

  test 'should not create user if email already exist' do
    assert_difference('User.count', 0) do
      post users_url, params: {user: { email: @user.email, name: @user.name, password: 'youshouldnotwatch', password_confirmation: 'youshouldnotwatch'}}
    end

    assert_redirected_to root_url
  end

end
