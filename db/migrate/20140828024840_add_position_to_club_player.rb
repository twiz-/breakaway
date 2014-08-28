class AddPositionToClubPlayer < ActiveRecord::Migration
  def change
    add_column :club_players, :position, :string
  end
end
