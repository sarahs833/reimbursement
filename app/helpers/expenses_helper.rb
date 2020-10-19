module ExpensesHelper

  def status_exist?(expense)
    if expense.status
      expense.status
    else
      "No status"
    end
  end
end
