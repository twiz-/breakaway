class AddLastNameToCollegeCoaches < ActiveRecord::Migration
  def change
    add_column :college_coaches, :last_name, :string
  end
end
