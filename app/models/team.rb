require 'united_states'

class Team < ApplicationRecord
  enum subdivision: [:varsity, :junior_varsity]
  enum state: UnitedStates.postal_codes.map(&:to_s).map(&:to_sym)

  has_many :scores
  has_many :penalties

  belongs_to :tournament

  validates :school, presence: true
  #validates :suffix
  validates :subdivision, presence: true
  validates :number, presence: true
  validates :city, presence: true
  validates :state, presence: true
  #validates :exhibition

  validates_uniqueness_of :number, scope: :tournament_id

  def score
    points + penalized_points
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
