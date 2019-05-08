class AddTournamentIdToEvents < ActiveRecord::Migration[6.0]
  def change
    add_reference :events, :tournament, null: false, foreign_key: true
  end
end
