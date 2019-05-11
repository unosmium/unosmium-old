class DropTableTournamentsUsers < ActiveRecord::Migration[6.0]
  def change
    drop_table :tournaments_users
  end
end
