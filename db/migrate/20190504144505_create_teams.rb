class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.string :school
      t.string :suffix
      t.integer :subdivision
      t.integer :number
      t.string :city
      t.integer :state

      t.timestamps
    end
    add_index :teams, :number, unique: true
  end
end
