class AddLocationAndStateToTournaments < ActiveRecord::Migration[6.0]
  def change
    add_column :tournaments, :location, :string, null: false
    add_column :tournaments, :state, :integer

    # remove 'null: false' constrainst from name
    remove_column :tournaments, :name, :string
    add_column :tournaments, :name, :string
  end
end
