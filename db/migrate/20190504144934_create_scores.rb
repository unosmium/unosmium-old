class CreateScores < ActiveRecord::Migration[6.0]
  def change
    create_table :scores do |t|
      t.references :event, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true
      t.boolean :participated, null: false, default: true
      t.boolean :disqualified, null: false, default: false
      t.decimal :score # see note about place in Placings migration
      t.integer :tiebreaker_place # also will be custom validated

      t.timestamps
    end
  end
end
