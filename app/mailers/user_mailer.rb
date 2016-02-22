class UserMailer < ApplicationMailer
  #
  # def account_activation(user)
  #   @user = user
  #   mail(to: user.email, subject: "Welcome to Polis",
  #        bcc: ["cbstodd@me.com", "New Polis member"])
  # end

  def account_activation(user)
    @user = user
    mail to: user.email, subject: "Welcome to Lowdown"
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password reset"
  end
end
