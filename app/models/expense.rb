class Expense < ApplicationRecord
  belongs_to :account

  USAGE = %w[Lunch Transport Vpn Other]
  validates :usage, presence: true, inclusion: {in: USAGE }
  validates :date, presence: true
  validates :amount, numericality: { other_than: 0 }
  validates :people, numericality: { other_than: 0 }

end
