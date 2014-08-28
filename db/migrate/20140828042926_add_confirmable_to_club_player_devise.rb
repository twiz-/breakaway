class AddConfirmableToClubPlayerDevise < ActiveRecord::Migration
  def self.up
    add_column :club_players, :confirmation_token, :string
    add_column :club_players, :confirmed_at, :datetime
    add_column :club_players, :confirmation_sent_at, :datetime
    
    add_index :club_players, :confirmation_token, :unique => true
    
    ClubPlayer.update_all(:confirmed_at => Time.now)
  end
  def self.down
    remove_columns :club_players, :confirmation_token, :confirmed_at, :confirmation_sent_at
  end
end
