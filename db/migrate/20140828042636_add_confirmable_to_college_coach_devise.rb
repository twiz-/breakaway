class AddConfirmableToCollegeCoachDevise < ActiveRecord::Migration
  def self.up
    add_column :college_coaches, :confirmation_token, :string
    add_column :college_coaches, :confirmed_at, :datetime
    add_column :college_coaches, :confirmation_sent_at, :datetime
    
    add_index :college_coaches, :confirmation_token, :unique => true
    
    CollegeCoach.update_all(:confirmed_at => Time.now)
  end
  def self.down
    remove_columns :college_coaches, :confirmation_token, :confirmed_at, :confirmation_sent_at
    # remove_columns :users, :unconfirmed_email # Only if using reconfirmable
  end
end
