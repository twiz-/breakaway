class AddLinkIdToStats < ActiveRecord::Migration
  def change
    add_column :stats, :link_id, :integer
  end
end
