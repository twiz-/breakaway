class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.date :scheduled_date
      t.string :opponent
      t.text :location
      t.integer :user_id

      t.timestamps
    end
  end
end
