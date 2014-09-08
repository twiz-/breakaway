class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.integer :clicker
      t.datetime :clicked_at

      t.timestamps
    end
  end
end
