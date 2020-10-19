class Expense < ApplicationRecord
  belongs_to :user
  attr_accessor :_destroy

  USAGE = %w[lunch transport vpn other]
  validates :usage, presence: true, inclusion: {in: USAGE }
  validates :date, presence: true
  validates :amount, numericality: { other_than: 0 }
  validates :people, numericality: { other_than: 0 }

end
