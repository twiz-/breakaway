class AddVerifiedToCollegeCoaches < ActiveRecord::Migration
  def change
    add_column :college_coaches, :verified, :boolean
  end
end
