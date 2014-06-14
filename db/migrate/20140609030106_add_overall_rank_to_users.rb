class AddOverallRankToUsers < ActiveRecord::Migration
  def change
    add_column :users, :overall_rank, :integer, default: 0
    change_column :users, :total_points, :integer, default: 0
  end
end
