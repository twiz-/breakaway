class AddIndexexToFriendshipsTable < ActiveRecord::Migration
  def change
    add_index :user_friendships, :friend_id
    add_index :user_friendships, :college_coach_id
    
    add_index :listings, :club_player_id
  end
end
