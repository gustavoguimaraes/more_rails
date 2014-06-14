class AddCurrentToGames < ActiveRecord::Migration
  def change
    add_column :games, :lock_predictions, :boolean
  end
end
