class User < ApplicationRecord
  has_many :accounts
  has_many :expenses, through: :accounts

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                         format: { with: VALID_EMAIL_REGEX },
                        uniqueness: true
  validates :password, length: { minimum: 6 }

  has_secure_password

  # def expenses_attributes=(expense_attributes)
  #   expense_attributes.values.each do |expense_attribute|
  #     expense = Expense.create(expense_attribute)
  #     self.expenses << expense
  #   end
  # end
end
