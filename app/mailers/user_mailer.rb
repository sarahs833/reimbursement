class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.notification.subject
  #
  def notification(user_id)
    @user = User.find(user_id)
    @expenses = @user.expenses

    mail to: @user.email, subject:'Expenses submited'
  end
end
