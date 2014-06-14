class CreateUserScores < ActiveRecord::Migration
  def change
    create_table :user_scores do |t|
      t.integer :user_id
      t.integer :game_id
      t.integer :team_1_prediction
      t.integer :team_2_prediction
      t.boolean :successful_prediction, default: false
      t.integer :points, default: 0
      t.timestamps
    end
  end
end
