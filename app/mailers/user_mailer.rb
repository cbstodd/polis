class UserMailer < ApplicationMailer

  def account_activation(user)
    @user = user
    mail(to: user.email, subject: "Welcome #{user.username}",
         bcc: ["cbstodd@gmail.com", "New Polis member"])
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password reset"
  end
end
