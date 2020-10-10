require 'test_helper'

class AccountsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @user = users(:one)
    @expense = expenses(:one)
  end

  test 'should get index' do
    post sessions_create_path, params: { session: { email: @user.email, password: 'testing' } }
    get accounts_url
    assert_response :success
  end

  test 'should get new' do
    post sessions_create_path, params: { session: { email: @user.email, password: 'testing' } }
    get new_account_path
    assert_response :success
  end

  test 'should create account and expenses' do
    post sessions_create_path, params: { session: { email: @user.email, password: 'testing' } }
    assert_difference('Expense.count') do
      post accounts_url, params: {account: { expenses_attributes: [{ date: @expense.date, amount: @expense.amount, usage: 'Other', people: @expense.people, status: @expense.status }] } }
    end
    assert_redirected_to accounts_path
  end

end
