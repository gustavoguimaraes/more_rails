class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :team_1
      t.string :team_2
      t.integer :team_1_score
      t.integer :team_2_score
      t.boolean :final
      t.datetime :schedule

      t.timestamps
    end
  end
end
