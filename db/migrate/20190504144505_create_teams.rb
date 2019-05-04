class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.string :school
      t.string :suffix
      t.string :subdivision
      t.integer :number
      t.string :city
      t.string :state

      t.timestamps
    end
    add_index :teams, :number, unique: true
  end
end
