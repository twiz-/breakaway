class ChangeFormatInSubscriptions < ActiveRecord::Migration
  def change
    change_column :subscriptions, :amount, :integer
  end
end
