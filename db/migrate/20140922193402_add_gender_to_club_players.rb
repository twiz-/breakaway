class AddGenderToClubPlayers < ActiveRecord::Migration
  def change
    add_column :club_players, :gender, :string
  end
end
