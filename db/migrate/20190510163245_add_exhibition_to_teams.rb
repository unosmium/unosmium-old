class AddExhibitionToTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :exhibition, :boolean
  end
end
