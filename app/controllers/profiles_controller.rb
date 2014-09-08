class ProfilesController < ApplicationController

  def index
    current_friend_ids = current_college_coach.try(:friend_ids)
 
    unless current_friend_ids.blank?
      @search = ClubPlayer.where("id NOT IN (?)", current_friend_ids).search(params[:q])
    else
      @search = ClubPlayer.search(params[:q])
    end
    @profiles = @search.result    
  end
  
  
  def show
    @player = ClubPlayer.find_by_profile_name(params[:profile_name])
  
    if @player
      @listings = @player.listings
      @games = @player.games
      respond_to do |format|
        format.html
        format.csv {send_data Game.to_csv(@games)}
      end
      return
      render action: :show
    else 
      render file: "public/404", status: 404, formats: [:html]
    end
  end
  
  def create_short_url
    if current_club_player.subscribed? && current_club_player.link.nil?
      link = Link.new
      link.slug = SecureRandom.urlsafe_base64(6)
      link.given_profile_url = "/" + current_club_player.profile_name
      link.club_player_id = current_club_player.id
      link.save
    else
      redirect_to dashboard_path, notice: "Subscribe first"
    end
  end
  
end
