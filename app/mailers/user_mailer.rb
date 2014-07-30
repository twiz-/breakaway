class UserMailer < ActionMailer::Base
  include Devise::Controllers::UrlHelpers #
  include Devise::Mailers::Helpers
  helper :application # gives access to all helpers defined within 
  
  default from: "tony@54footy.com"

  def confirmation_instructions(record, token, opts={})
    @token = token
    devise_mail(record, :confirmation_instructions)
  end

  def reset_password_instructions(record, token, opts={})
    @token = token
    devise_mail(record, :reset_password_instructions)
  end

  def unlock_instructions(record, token, opts={})
    @token = token
    devise_mail(record, :unlock_instructions)
  end
end