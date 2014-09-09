class AddDisabledToClubPlayers < ActiveRecord::Migration
  def change
    add_column :club_players, :disabled, :boolean, default: false
  end
end
