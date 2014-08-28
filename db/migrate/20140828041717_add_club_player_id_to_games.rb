class AddClubPlayerIdToGames < ActiveRecord::Migration
  def change
    add_column :games, :club_player_id, :integer
  end
end
