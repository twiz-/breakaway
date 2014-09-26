class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :check_domain
  protect_from_forgery with: :exception
  \
  
  # def configure_permitted_parameters
  #  devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :email, :password, :password_confirmation) } # The :firstname and :lastname are my custom fields.
  # end
  def after_sign_in_path_for(user)
    dashboard_path
  end
  
  def check_domain
    if Rails.env.production? and request.host.downcase != '54footy.com'
        redirect_to request.protocol + '54footy.com' + request.fullpath, :status => 301
      end
  end
  
  protected
  def devise_parameter_sanitizer
    if resource_class == ClubPlayer
      ClubPlayerParameterSanitizer.new(ClubPlayer, :club_player, params)
    elsif resource_class == CollegeCoach
      CollegeCoachParameterSanitizer.new(CollegeCoach, :college_coach, params)
    else
      super
    end    
  end 
end
