class CreatePenalties < ActiveRecord::Migration[6.0]
  def change
    create_table :penalties do |t|
      t.references :team, null: false, foreign_key: true
      t.integer :points

      t.timestamps
    end
  end
end
