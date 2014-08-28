class AddGradYearToClubPlayer < ActiveRecord::Migration
  def change
    add_column :club_players, :grad_year, :integer
  end
end
