class AddDisabledToCollegeCoaches < ActiveRecord::Migration
  def change
    add_column :college_coaches, :disabled, :boolean, default: false
  end
end
