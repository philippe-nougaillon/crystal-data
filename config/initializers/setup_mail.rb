# encoding: utf-8

ActionMailer::Base.smtp_settings = {  
  :address              => "mail.gandi.net",  
  :port                 => 587,  
  :domain               => "crystaldata.net",  
  :user_name            => "notification@crystaldata.net",  
  :password             => "CD2016!!",  
  :authentication       => "plain",  
  :enable_starttls_auto => true  
}
