class UserMailer < ActionMailer::Base
  def welcome_email(_user)
    recipients    _user.email #Can be a string or array of strings
    from          "My Awesome Site Notifications <notifications@example.com>"
    subject       "Welcome to My Awesome Site"
    sent_on       Time.now
  end

end
