class DropCoaches < ActiveRecord::Migration
  
  def up
    drop_table :coaches
  end
  
  def down
  end
  
end
