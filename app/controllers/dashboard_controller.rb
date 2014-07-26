class DashboardController < ApplicationController
  before_filter :authenticate_player!
  
  def show
    if current_coach
       @profiles = current_coach.friends
    else
      @listings = current_player.listings
      @games = current_player.games
      @player = current_player
    end
  end
end
