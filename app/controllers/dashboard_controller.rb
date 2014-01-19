class DashboardController < ApplicationController
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
