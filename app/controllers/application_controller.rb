class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  \
  
  
  protected
  def devise_parameter_sanitizer
    if resource_class == Player
      PlayerParameterSanitizer.new(Player,:player,params)
    elsif resource_class == Coach
      CoachParameterSanitizer.new(Coach,:coach,params)
    else
      super
    end    
  end 
end
