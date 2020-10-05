class Expense < ApplicationRecord
  belongs_to :account
  attr_accessor :expenses_attributes

  USAGE = %w[Lunch Transport Vpn Other]
  validates :usage, presence: true, inclusion: {in: USAGE }
  validates :date, presence: true
  validates :amount, numericality: { other_than: 0 }
  validates :people, numericality: { other_than: 0 }

  def expenses_attributes=(expense_attributes)
    expense_attributes.values.each do |expense_attribute|
      expense = Expense.find_by_or_create(expense_attribute)
      self.expenses << expense
    end
  end

end
