class ClubPlayerParameterSanitizer < Devise::ParameterSanitizer
  
  def sign_up
    default_params.permit(:first_name, :last_name, :profile_name, :password, :password_confirmation, :email, :grad_year, :position, :club_team, :formation, :current_password, :gender)
  end
  def account_update
    default_params.permit(:first_name, :last_name, :profile_name, :password, :password_confirmation, :email, :grad_year, :position, :club_team, :formation, :current_password, :gender)
  end
end

# it seems that if you have an account update method you need to specify current password, because on the
# coach model I didn't need to specify current password and it still worked