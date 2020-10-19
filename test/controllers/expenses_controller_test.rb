require 'test_helper'

class ExpensesControllerTest < ActionDispatch::IntegrationTest
   setup do
    @user = users(:one)
    @expense = expenses(:one)
  end

  test 'should get index' do
    post sessions_create_path, params: { session: { email: @user.email, password: 'testing' } }
    get expenses_url
    assert_response :success
  end

  test 'should get new' do
    post sessions_create_path, params: { session: { email: @user.email, password: 'testing' } }
    get users_new_expense_path
    assert_response :success
  end

  test 'should create account and expenses' do
    post sessions_create_path, params: { session: { email: @user.email, password: 'testing' } }
    assert_difference('Expense.count') do
      post users_create_expense_url, params: {user: { expenses_attributes: [{ date: @expense.date, amount: @expense.amount, usage: 'Other', people: @expense.people, status: @expense.status }] } }
    end
    assert_redirected_to expenses_path
  end

  # test "the truth" do
  #   assert true
  # end
end
