class CreateScores < ActiveRecord::Migration[6.0]
  def change
    create_table :scores do |t|
      t.references :event, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true
      t.boolean :participated, null: false, default: true
      t.boolean :disqualified, null: false, default: false
      t.decimal :score # null value indicates DNP or disqualified,
                       # will have a validation for this
      t.integer :tiebreaker_place # null value indicates no tie,
                                  # also will be custom validated

      t.timestamps
    end
  end
end
