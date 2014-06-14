class AddRoundToGames < ActiveRecord::Migration
  def change
    add_column :games, :round_number, :integer
    add_index :games, :round_number
  end
end
