class ChangeClickerFormatInStats < ActiveRecord::Migration
  
  def up
    change_column :stats, :clicker, :string  
  end
  
  def down
    change_column :stats, :clicker, :integer
  end
end
