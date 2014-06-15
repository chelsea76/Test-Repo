class AdminMailer < ActionMailer::Base
  default from: "demo123@demo.com"
  
  def invite(user)
    @user = user
    @url = "http://test-complitech-app.herokuapp.com/writers/new"
    mail(to: @user.email, subject: "Invitation")
  end
end
