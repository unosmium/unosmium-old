class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.boolean :trial, null: false, default: false
      t.boolean :trialed, null: false, default: false
      t.integer :scoring, null: false, default: 0 # high

      t.timestamps
    end
    add_index :events, :name, unique: true
  end
end
