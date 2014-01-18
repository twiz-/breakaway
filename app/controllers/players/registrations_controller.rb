class Players::RegistrationsController < Devise::RegistrationsController
  before_filter :devise_parameter_sanitizer  

end