class RemovePlayerIdFromListings < ActiveRecord::Migration
  def change
    remove_column :listings, :player_id, :integer
  end
end
