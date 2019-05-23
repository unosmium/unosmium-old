class ModifyRoles < ActiveRecord::Migration[6.0]
  def change
    drop_table :event_supervisors_events
    drop_table :roles

    create_table :admin_roles do |t|
      t.references :user, null: false, foreign_key: true
      t.references :tournament, null: false, foreign_key: true

      t.timestamps
    end

    create_table :event_supervisor_roles do |t|
      t.references :user, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.boolean :finalized, null: false, default: false
      t.references :counseled_by, foreign_key: {to_table: :admin_roles}

      t.timestamps
    end
  end
end
