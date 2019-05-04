class CreateTournaments < ActiveRecord::Migration[6.0]
  def change
    create_table :tournaments do |t|
      t.string :name, null: false
      t.integer :level, null: false, default: 0 # Invitational
      t.integer :division, null: false
      t.integer :year, null: false
      t.date :date, null: false

      t.timestamps
    end
  end
end
