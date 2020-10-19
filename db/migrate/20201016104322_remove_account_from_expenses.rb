class RemoveAccountFromExpenses < ActiveRecord::Migration[6.0]
  def change
    remove_reference :expenses, :account, index: true, foreign_key: true
  end
end
