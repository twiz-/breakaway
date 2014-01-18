class AddClubToUsers < ActiveRecord::Migration
  def change
    add_column :users, :club_team, :string
  end
end
