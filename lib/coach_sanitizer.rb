class CoachParameterSanitizer < Devise::ParameterSanitizer
  def sign_up
    default_params.permit(:type,:last_name, :email, :password, :password_confirmation)
  end
end
