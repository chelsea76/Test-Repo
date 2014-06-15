class AdminMailer < ActionMailer::Base
  default from: "demo123@demo.com"
  
  def invite(user)
    @user = user
    @url = "http://localhost:3000/writers/new"
    mail(to: @user.email, subject: "Invitation")
  end
end
