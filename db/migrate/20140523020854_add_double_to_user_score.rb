class AddDoubleToUserScore < ActiveRecord::Migration
  def change
    add_column :user_scores, :double_or_nothing, :boolean
  end
end
