class Tournament < ApplicationRecord  
  enum level: [:Invitational, :Regionals, :States, :Nationals]
  enum division: [:A, :B, :C]

  has_many :events
  has_many :teams

  has_many :admin_roles
  has_many :event_supervisor_roles

  has_many :admins, through: :admin_roles, class_name: "User", source: :user
  has_many :event_supervisors, through: :event_supervisor_roles, class_name: "User", source: :user

  validates :level, presence: true
  validates :division, presence: true

  def number_of_teams
    teams.length
  end

  def final_standings
    teams.sort_by(&:score)
  end
end
