class CreateCoaches < ActiveRecord::Migration
  def change
    create_table :coaches do |t|

      t.timestamps
    end
  end
end
