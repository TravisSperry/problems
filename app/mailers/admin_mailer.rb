class AdminMailer < ActionMailer::Base
  default from: "mathres@aimath.org"

  def sign_up_notification(user, password)
    @user = user
    @password = password

    mail(to:          @user.email,
         subject:     'A MathrRES Account has been set up for you!')
  end
end
