class CreateTournamentsPresntationsJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :tournaments, :presentations do |t|
      t.index :tournament_id
      t.index :presentation_id
    end
  end
end
