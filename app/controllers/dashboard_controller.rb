class DashboardController < ApplicationController
  before_filter :check_coach_or_player
  before_filter :authenticate_club_player!, only: [:upgrade]
  
  def upgrade
    
  end
  
  def show
    if current_college_coach
       @profiles = current_college_coach.friends
       @favorite_games = current_college_coach.future_favorite_games.includes(:club_player)
    else
      @listings = current_club_player.listings
      @games = current_club_player.games
      @player = current_club_player
    end
  end
  
  def download_schedule
    send_data Game.to_csv(current_college_coach.future_favorite_games)
  end
  
  def cancel_subscription
    user = Stripe::Customer.retrieve(current_club_player.subscription.stripe_customer_id)
    plan = user.subscriptions["data"].first["id"]
    user.subscriptions.retrieve(plan).delete
    current_club_player.subscription.destroy
    redirect_to dashboard_path, notice: "You subscription has been cancelled"
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
