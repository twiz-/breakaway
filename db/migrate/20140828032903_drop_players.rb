class DropPlayers < ActiveRecord::Migration
  def up
    drop_table :players
  end
  def down
    create_table :players do |t|

      t.timestamps
    end
  end
end
