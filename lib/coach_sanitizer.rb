class CoachParameterSanitizer < Devise::ParameterSanitizer
  private
  def sign_up
    default_params.permit(:type, :email, :password, :password_confirmation)
  end
end