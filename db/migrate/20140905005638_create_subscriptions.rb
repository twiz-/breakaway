class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :club_player_id
      t.string :stripe_token
      t.decimal :amount
      t.string :email
      t.string :stripe_customer_id
      t.string :stripe_subscription_name
    end
  end
end
