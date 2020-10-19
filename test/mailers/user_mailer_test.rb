require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "notification" do
    mail = UserMailer.notification(users(:one).id)
    assert_equal "Expenses submited", mail.subject
    assert_equal ["sarah@gmail.com"], mail.to
    assert_equal ["swang4128@gmail.com"], mail.from
  end

end
