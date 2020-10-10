require 'test_helper'

class ExpenseTest < ActiveSupport::TestCase
  setup do
    @expense = Expense.new(account_id:1 , date: 2020-10-03, usage: 'vpn', amount: 10.0, people:1, description: 'hello', status: 'paid')
  end

  test "usage should be included in the list" do
    @expense.usage = 'No'
    assert_not @expense.valid?
  end

  test 'date should be present' do
    @expense.date = ''
    assert_not @expense.valid?
  end

  test 'amount should not be 0' do
    @expense.amount = 0
    assert_not @expense.valid?
  end

  test 'people should not be 0' do
    @expense.people = 0
    assert_not @expense.valid?
  end


end
