class AddMissingIndexes < ActiveRecord::Migration
  def change
    add_index :games, :club_player_id
    add_index :games, :scheduled_date
    add_index :games, :player_id
  end
end
