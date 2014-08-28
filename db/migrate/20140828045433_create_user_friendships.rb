class CreateUserFriendships < ActiveRecord::Migration
  def change
    create_table :user_friendships do |t|
      t.integer :college_coach_id
      t.integer :friend_id

      t.timestamps
    end
  end
end
