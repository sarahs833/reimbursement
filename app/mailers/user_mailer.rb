class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.notification.subject
  #
  def notification(user_id,account_id)
    @user = User.find(user_id)
    @expenses = Account.find(account_id).expenses


    mail to: @user.email, subject:'Expenses submited'
  end
end
