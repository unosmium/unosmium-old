require 'united_states'

class Team < ApplicationRecord
  enum subdivision: [:varsity, :junior_varsity]
  enum state: UnitedStates.postal_codes.map(&:to_s).map(&:to_sym)

  has_many :scores
  has_many :penalties

  belongs_to :tournament

  def score
    points - penalized_points
  end

  def points
    points = 0
    tournament.events.each do |event|
      next if event.trial || event.trialed
      team_score = team_score + event.placing(number)
    end
    points
  end

  def penalized_points
    penalties.reduce(0) { |sum, penalty| sum + penalty.points }
  end
end
