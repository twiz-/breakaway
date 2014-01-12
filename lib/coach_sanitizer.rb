class CoachParameterSanitizer < Devise::ParameterSanitizer
  private
  def sign_up
    default_params.permit(:type)
  end
end