# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Test::Application.initialize!

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {  
      :address              => "smtp.gmail.com",  
      :port                 => 587,  
      :domain               => "test-complitech-app.herokuapp.com",  
      :user_name            => ENV["GMAIL_USERNAME"],
      :password             => ENV["GMAIL_PASSWORD"],
      :authentication       => "plain",  
      :enable_starttls_auto => true  
   }
