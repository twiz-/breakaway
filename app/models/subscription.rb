class Subscription < ActiveRecord::Base
  belongs_to :club_player
  
  def club_player_name
    club_player.full_name
  end
  
end