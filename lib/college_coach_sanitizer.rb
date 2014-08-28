class CollegeCoachParameterSanitizer < Devise::ParameterSanitizer
  def sign_up
    default_params.permit(:last_name, :email, :password, :password_confirmation)
  end
end
