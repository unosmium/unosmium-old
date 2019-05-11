class CreatePresentation < ActiveRecord::Migration[6.0]
  def change
    create_table :presentations do |t|
      t.timestamps
    end
  end
end
