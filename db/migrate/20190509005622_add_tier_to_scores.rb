class AddTierToScores < ActiveRecord::Migration[6.0]
  def change
    add_column :scores, :tier, :integer
  end
end
