class ChangeEventNameUniqueness < ActiveRecord::Migration[6.0]
  def change
    remove_index :events, :name
    add_index :events, :name
  end
end
