class AddFormationToClubPlayer < ActiveRecord::Migration
  def change
    add_column :club_players, :formation, :string
  end
end
