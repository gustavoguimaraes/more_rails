class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :country
      t.integer :rank

      t.timestamps
    end
  end
end
