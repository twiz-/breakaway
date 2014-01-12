class PlayerParameterSanitizer < Devise::ParameterSanitizer
  def sign_up
    default_params.permit(:type)
  end
end