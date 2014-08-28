class DashboardController < ApplicationController
  before_filter :check_coach_or_player
  
  def show
    if current_college_coach
       @profiles = current_college_coach.friends
    else
      @listings = current_club_player.listings
      @games = current_club_player.games
      @player = current_club_player
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
