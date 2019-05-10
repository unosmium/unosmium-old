class Tournament < ApplicationRecord  
  enum level: [:Invitational, :Regionals, :States, :Nationals]
  enum division: [:A, :B, :C]

  has_many :events
  has_many :teams
  has_many :admins
  has_many :event_supervisors

  validates :level, presence: true
  validates :division, presence: true

  def number_of_teams
    teams.length
  end

  def final_standings
    teams.sort_by(&:score)
  end
end
