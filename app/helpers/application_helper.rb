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
      %Q{<iframe title="YouTube video player" width="640" height="390" src="http://www.youtube.com/embed/#{ youtube_id }" frameborder="0" allowfullscreen></iframe>}
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
  
  def display_dialog(partil_name=nil, title=nil, dialog_id='dialog', wrapper_class=nil, model_width_class=nil )
 
    content_tag(:div, id: dialog_id, class: "modal in #{wrapper_class}", 'aria-hidden' => "true", 'aria-labelledby' => 'dialogLabel', role: 'dialog', tabindex: '-1') do
      content_tag(:div, class: "modal-dialog #{model_width_class}") do
        content_tag(:div, class: 'modal-content') do
         concat( modal_header_markup(title) )
         concat( modal_body_markup(partil_name) )  
         #concat( modal_footer_markup )  
        end    
      end
    end
  end

  def modal_header_markup(title)
    content_tag(:div, class: 'modal-header') do 
      concat(
        content_tag(:button, class: 'close', 'data-dismiss' => 'modal', type: 'button' ) do 
          'x'
        end
      )

      concat(
        content_tag(:h4, class: 'dialogLabel modal-title') do 
          title
        end
      )
    end
  end

  def modal_body_markup(partil_name)
    content_tag(:div, class: 'modal-body') do
      render partial: partil_name if partil_name
    end
  end

  def modal_footer_markup
    content_tag(:div, class: 'modal-footer') do
      content_tag(:button, class:  'btn btn-danger btn-sm',  'data-dismiss' => 'modal', type: 'button') do 
        'Close'
      end
    end
  end
end
