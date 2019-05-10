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
    tournament.events.reduce(0) do |points, event|
      next if event.trial || event.trialed
      points + event.placing(number)
    end
  end

  def penalized_points
    penalties.reduce(0) { |sum, penalty| sum + penalty.points }
  end
end
