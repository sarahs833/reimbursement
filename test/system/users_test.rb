require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "creating a User" do
    visit root_url

    fill_in "Email", with: 'test@gmail.com'
    fill_in "Name", with: @user.name
    fill_in "Password", with: 'testing'
    fill_in 'Password confirmation', with: 'testing'
    click_on "Sign Up"

    assert_text "User was successfully created"
  end

end
