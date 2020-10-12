class Account < ApplicationRecord
  belongs_to :user
  has_many :expenses
  accepts_nested_attributes_for :expenses

  def send_notification_mail
    UserMailer.notification(self.user.id, self.id).deliver_later
  end
end
