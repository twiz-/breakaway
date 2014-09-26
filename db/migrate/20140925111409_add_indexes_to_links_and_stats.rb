class AddIndexesToLinksAndStats < ActiveRecord::Migration
  def change
    add_index :links, :club_player_id
    add_index :stats, :link_id
    add_index :subscriptions, :club_player_id
  end
end
