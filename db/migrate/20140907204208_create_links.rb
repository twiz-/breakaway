class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :given_profile_url
      t.string :slug
      t.integer :clicks , default: 0
      t.integer :club_player_id

      t.timestamps
    end
  end
end
