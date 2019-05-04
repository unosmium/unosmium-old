class CreateScores < ActiveRecord::Migration[6.0]
  def change
    create_table :scores do |t|
      t.references :event, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true
      t.boolean :participated
      t.boolean :disqualified
      t.decimal :score
      t.integer :tiebreaker_place

      t.timestamps
    end
  end
end
