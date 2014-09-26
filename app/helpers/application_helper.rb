module ApplicationHelper
    
  def return_edit_account_path(user)
    user == current_club_player ? edit_club_player_registration_path : edit_college_coach_registration_path
  end
  
  def user_signed_in?
    college_coach_signed_in? || club_player_signed_in?
  end
  
  def current_user
    current_college_coach || current_club_player
  end
  def youtube_embed(youtube_url)
      if youtube_url[/youtu\.be\/([^\?]*)/]
        youtube_id = $1
      else
        youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
        youtube_id = $5
      end
      %Q{<iframe title="YouTube video player" width="640" height="390" src="https://www.youtube.com/embed/#{ youtube_id }" frameborder="0" allowfullscreen></iframe>}
  end
  def parse_youtube_id(youtube_url)
    if youtube_url[/youtu\.be\/([^\?]*)/]
      youtube_id = $1
    else
      youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
      youtube_id = $5
    end
    youtube_id
  end
  def youtube_thumb_embed(youtube_url)
    if youtube_url[/youtu\.be\/([^\?]*)/]
      youtube_id = $1
    else
      youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
      youtube_id = $5
    end
    youtube_id
  end
  
  def position_helper
    positions = ["forward", "defender", "outside back", "center-mid", "winger" ]    
    positions.sample
  end
  
  #if the user is signed in and their current_sign in at and time.now difference than 3 seconds run 
  # the identify script  
  def fresh_user_session_for_segment?
     fresh = Time.now - current_user.current_sign_in_at < 3
     user_signed_in? && fresh ? true : false    
  end
  
end
