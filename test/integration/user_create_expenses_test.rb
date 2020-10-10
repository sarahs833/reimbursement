require 'test_helper'

class UsersCreateExpensesTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
    @expense = expenses(:one)
  end

  test "user sign in and create expenses and view his dashboard" do
    post sessions_create_path, params: { session: { email: @user.email, password: 'testing' } }
    assert_equal @user.id, session[:user_id]
    get new_account_url
    assert_difference('Expense.count') do
      post accounts_url, params: {account: { expenses_attributes: [{ date: @expense.date, amount: @expense.amount, usage: 'Other', people: @expense.people, status: @expense.status }] } }
    end
    get accounts_url
    assert_select 'td', text: "#{@expense.date}",count: 2
    assert_select 'td', text: "#{@expense.amount}",count: 2
    assert_select 'td', text: "#{@expense.people}",count: 2
    assert_select 'tr' do
      assert_select 'td', 10
    end
  end


end
