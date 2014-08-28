class AddClubPlayerIdToListings < ActiveRecord::Migration
  def change
    add_column :listings, :club_player_id, :integer
  end
end
