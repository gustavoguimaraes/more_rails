class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :round_number
      t.string :round_name
      t.datetime :start_date
      t.boolean :current
      t.timestamps
    end
  end
end
