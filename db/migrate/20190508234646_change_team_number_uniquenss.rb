class ChangeTeamNumberUniquenss < ActiveRecord::Migration[6.0]
  def change
    remove_index :teams, :number
    add_index :teams, :number
  end
end
