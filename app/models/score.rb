class Score < ApplicationRecord
  belongs_to :event
  belongs_to :team

  # validates :participated
  # validates :disqualified
  # validates :score
  # validates :tiebreaker_place
  # validates :tier

  # tier: The tier of the team. Integer > 0

  # team points to be awarded to the team with this score
  def points
    return 0 if event.trial? || event.trialed?

    points_if_not_trial
  end

  # team points ignoring trial/trialed status
  def points_if_not_trial
    n = event.tournament.number_of_competing_teams

    if disqualified? then n + 2
    elsif !participated? then n + 1
    elsif score.nil? then n
    else calculate_points
    end
  end

  private

  # additional points logic for exhibition teams, somewhat arbitrary
  def calculate_points
    if team.exhibition?
      event.standings_including(team).find_index(self) + 1
    else
      event.standings.find_index(self) + 1
    end
  end
end
