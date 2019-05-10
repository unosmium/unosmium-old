class AddTournamentToRole < ActiveRecord::Migration[6.0]
  def change
    add_reference :roles, :tournament, null: false, foreign_key: true
  end
end
