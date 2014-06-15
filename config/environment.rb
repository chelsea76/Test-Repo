# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Test::Application.initialize!

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {  
      :address              => "smtp.gmail.com",  
      :port                 => 587,  
      :domain               => "gmail.com",  
      :user_name            => "pdipesh87", #Your user name
      :password             => "dipu8787", # Your password
      :authentication       => "plain",  
      :enable_starttls_auto => true  
   }
