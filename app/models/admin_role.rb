class AdminRole < ApplicationRecord
  belongs_to :tournament
  belongs_to :user
  
  has_many :counseled_event_supervisors, class_name: 'EventSupervisorRole',
                                         foreign_key: :counseled_by_id

  has_many :counseled_events, through: :counseled_event_supervisors,
                              source: :event
end
