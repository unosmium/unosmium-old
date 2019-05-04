class CreatePlacings < ActiveRecord::Migration[6.0]
  def change
    create_table :placings do |t|
      t.references :event, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true
      t.boolean :participated
      t.boolean :disqualified
      t.integer :place

      t.timestamps
    end
  end
end
