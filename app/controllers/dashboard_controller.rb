class DashboardController < ApplicationController
  before_filter :check_coach_or_player
  before_filter :authenticate_club_player!, only: [:upgrade]
  
  def upgrade
    redirect_to(dashboard_path, notice: "You are already subscribed, no need to subscribe again :)") if current_club_player.subscribed? 
  end
  
  def show
    if current_college_coach
       @profiles = current_college_coach.friends
       @favorite_games = current_college_coach.future_favorite_games
    else
      @listings = current_club_player.listings
      @games = current_club_player.games
      @player = current_club_player
      @stats = current_club_player.link.stats.order(created_at: :desc).to_a if current_club_player.link.present?
      @game = Game.new
    end
  end
  
  def download_schedule
    send_data Game.to_csv_favorites(current_college_coach.future_favorite_games)
  end
  
  def cancel_subscription
    current_club_player.cancel_subscription_plan
    redirect_to dashboard_path, notice: "You subscription has been cancelled"
  end
  
  def create_short_url
    if current_club_player.subscribed? && current_club_player.link.nil?
      link = Link.new
      link.slug = SecureRandom.urlsafe_base64(6)
      link.given_profile_url = "/" + current_club_player.profile_name
      link.club_player_id = current_club_player.id
      link.save
      redirect_to dashboard_path, notice: "Link created, check it out in the My Profile Stats tab."
    else
      redirect_to dashboard_path, notice: "Subscribe first"
    end
  end
  
  private 
  
  def check_coach_or_player
    if current_college_coach
      :authenticate_college_coach!
    elsif current_club_player
      :authenticate_club_player!
    else 
      redirect_to root_path, notice: "Must be signed in to do that"
    end
  end   
end
