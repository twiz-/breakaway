class PlayerParameterSanitizer < Devise::ParameterSanitizer
  private
  def sign_up
    default_params.permit(:first_name, :last_name, :profile_name, :password, :password_confirmation, :email, :grad_year, :position, :club_team, :formation)
  end
  def account_update
    default_params.permit(:first_name, :last_name, :profile_name, :password, :password_confirmation, :email, :grad_year, :position, :club_team, :formation)
  end
end