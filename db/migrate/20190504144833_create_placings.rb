class CreatePlacings < ActiveRecord::Migration[6.0]
  def change
    create_table :placings do |t|
      t.references :event, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true
      t.boolean :participated, null: false, default: true
      t.boolean :disqualified, null: false, default: false
      t.integer :place # null value indicates DNP or disqualified,
                       # will have a validation for this

      t.timestamps
    end
  end
end
