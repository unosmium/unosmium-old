class CreateTournaments < ActiveRecord::Migration[6.0]
  def change
    create_table :tournaments do |t|
      t.string :name
      t.integer :level
      t.integer :division
      t.integer :year
      t.date :date

      t.timestamps
    end
  end
end
