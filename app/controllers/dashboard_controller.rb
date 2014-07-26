class DashboardController < ApplicationController
  before_filter :check_coach_or_player
  
  def show
    if current_coach
       @profiles = current_coach.friends
    else
      @listings = current_player.listings
      @games = current_player.games
      @player = current_player
    end
  end
  
  private 
  def check_coach_or_player
    if current_coach
      :authenticate_coach!
    elsif current_player
      :authenticate_player!
    else 
      redirect_to root_path, notice: "Must be signed in ot do that"
    end
  end
end
