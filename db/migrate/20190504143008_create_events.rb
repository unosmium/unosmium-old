class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.boolean :trial
      t.boolean :trialed
      t.string :scoring

      t.timestamps
    end
    add_index :events, :name, unique: true
  end
end
