class AddProfileNameToClubPlayer < ActiveRecord::Migration
  def change
    add_column :club_players, :profile_name, :string
  end
end
