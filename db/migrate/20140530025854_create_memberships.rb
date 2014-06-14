class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer :league_id
      t.integer :user_id
      t.integer :rank
      t.timestamps
    end
  end
end
