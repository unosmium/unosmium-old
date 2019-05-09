require 'united_states'

class Team < ApplicationRecord
  enum subdivision: [:varsity, :junior_varsity]
  enum state: UnitedStates.postal_codes.map(&:to_s).map(&:to_sym)

  has_many :scores
  belongs_to :tournament

  def score
    team_score = 0
    tournament.events.each do |event|
      next if event.trial || event.trialed
      team_score = team_score + event.placing(number)
    end
    team_score
  end
end
