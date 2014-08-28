class AddFirstNameToClubPlayer < ActiveRecord::Migration
  def change
    add_column :club_players, :first_name, :string
  end
end
