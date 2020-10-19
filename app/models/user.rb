class User < ApplicationRecord
  has_many :expenses
  accepts_nested_attributes_for :expenses

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                         format: { with: VALID_EMAIL_REGEX },
                        uniqueness: true
  validates :password, presence: true,length: { minimum: 6 }, on: :create

  has_secure_password

  def send_notification_mail
    UserMailer.notification(self.id).deliver_later
  end

  def append_expenses(expenses_attributes)
    expenses_attributes.values.each do |expense_attribute|
      expense = Expense.new(expense_attribute)
      self.expenses << expense
    end
  end

end
