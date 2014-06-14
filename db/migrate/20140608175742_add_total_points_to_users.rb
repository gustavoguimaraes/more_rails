class AddTotalPointsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :total_points, :integer
    add_index :users, :total_points
  end
end
