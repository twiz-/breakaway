class PlayerParameterSanitizer < Devise::ParameterSanitizer
  def sign_up
    default_params.permit(:type, :email, :password, :password_confirmation)
  end
end