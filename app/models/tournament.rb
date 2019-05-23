class Tournament < ApplicationRecord  
  enum level: [:Invitational, :Regionals, :States, :Nationals]
  enum division: [:A, :B, :C]
  enum state: UnitedStates.postal_codes.map { |c| c.to_s.to_sym }

  has_many :events
  has_many :teams

  has_many :admin_roles
  has_many :admins, through: :admin_roles, class_name: "User", source: :user

  has_many :event_supervisor_roles, through: :events

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

  def number_of_non_exhibition_teams
    teams.count { |t| !t.exhibition? }
  end

  def placings
    teams.sort do |a,b|
      cmp = a.points - b.points
      cmp.zero? ? break_tie(a, b) : cmp
    end
  end

  def standings
    placings.reject(&:exhibition)
  end

  private

  def break_tie(team_a, team_b)
    team_a.standing_counts
      .zip(team_b.standing_counts)
      .map { |counts| counts.last - counts.first }
      .find(proc { team_a.number <=> team_b.number }, &:nonzero?)
  end
end
