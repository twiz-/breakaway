class AddClubTeamToClubPlayer < ActiveRecord::Migration
  def change
    add_column :club_players, :club_team, :string
  end
end
