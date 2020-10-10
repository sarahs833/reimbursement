require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(email: 'kaki@gmail.com', name:'kaki', password:'youshouldnot', password_confirmation:'youshouldnot')
  end

  test 'password should be longer than 6 characters' do
    @user.password = 'aa'
    @user.password_confirmation = 'aa'
    assert_not @user.valid?
  end

  test 'email should be unique' do
    @user.email = 'sarah@gmail.com'
    assert_not @user.valid?
  end

  test 'name should be present' do
    @user.name = ''
    assert_not @user.valid?
  end

  test 'email should be present' do
    @user.email = ''
    assert_not @user.valid?
  end

end
