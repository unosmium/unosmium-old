class Tournament < ApplicationRecord  
  enum level: [:Invitational, :Regionals, :States, :Nationals]
  enum division: [:A, :B, :C]
  enum state: UnitedStates.postal_codes.map { |c| c.to_s.to_sym }

  has_many :events
  has_many :teams

  has_many :admin_roles
  has_many :event_supervisor_roles
  has_many :admins, through: :admin_roles, class_name: "User", source: :user
  has_many :event_supervisors, through: :event_supervisor_roles, class_name: "User", source: :user

  has_and_belongs_to_many :presentations

  validates :location, presence: true
  validates :level, presence: true
  validates :division, presence: true
  validates :year, presence: true
  validates :date, presence: true
  validates :state, presence: true, if: proc { |t| t.Regionals? || t.States? }


  def number_of_teams
    teams.length
  end

  def number_of_competing_teams
    teams.reduce(0) { |sum, team| sum + (team.exhibition ? 0 : 1) }
  end

  def final_standings
    teams.sort_by(&:points)
  end
end
