class AddFormationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :formation, :string
  end
end
