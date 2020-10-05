class AddAcountToExpense < ActiveRecord::Migration[6.0]
  def change
    remove_reference :expenses, :user, index: true, foreign_key: true
    add_reference :expenses, :account, index: true, foreign_key: true
  end
end
