class RemoveClickedAtFromStats < ActiveRecord::Migration
  def change
    remove_column :stats, :clicked_at, :datetime
  end
end
