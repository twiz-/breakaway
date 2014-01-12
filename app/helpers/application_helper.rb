module ApplicationHelper
  
  def user_signed_in?
    coach_signed_in? || player_signed_in?
  end
  
  def current_user
    current_coach || current_player
  end
  
end
