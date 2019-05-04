class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.string :school, null: false
      t.string :suffix
      t.integer :subdivision
      t.integer :number, null: false
      t.string :city, null: false
      t.integer :state, null: false

      t.timestamps
    end
    add_index :teams, :number, unique: true
  end
end
