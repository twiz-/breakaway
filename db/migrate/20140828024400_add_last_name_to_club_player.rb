class AddLastNameToClubPlayer < ActiveRecord::Migration
  def change
    add_column :club_players, :last_name, :string
  end
end
