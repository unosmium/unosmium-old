class Tournament < ApplicationRecord  
  enum level: [:Invitational, :Regionals, :States, :Nationals]
  enum division: [:A, :B, :C]

  has_many :events
  has_many :teams

  validates :level, presence: true
  validates :division, presence: true

  def number_of_teams
    teams.length
  end
end
