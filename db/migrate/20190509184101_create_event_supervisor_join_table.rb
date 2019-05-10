class CreateEventSupervisorJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :event_supervisors, :events do |t|
      # t.index [:event_supervisor_id, :event_id]
      t.index [:event_id, :event_supervisor_id], unique: true, name: "index_events_on_supervisors"
    end
  end
end
