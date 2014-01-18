class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  \
  
  # def configure_permitted_parameters
  #  devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :email, :password, :password_confirmation) } # The :firstname and :lastname are my custom fields.
  # end
  
  protected
  def devise_parameter_sanitizer
    if resource_class == Player
      PlayerParameterSanitizer.new(Player, :player, params)
    elsif resource_class == Coach
      CoachParameterSanitizer.new(Coach,:coach,params)
    else
      super
    end    
  end 
end
