class CreateGameScores < ActiveRecord::Migration
  def change
    create_table :game_scores do |t|

      t.timestamps
    end
  end
end
