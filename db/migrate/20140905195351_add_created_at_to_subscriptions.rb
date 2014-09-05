class AddCreatedAtToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :created_at, :datetime
  end
end
