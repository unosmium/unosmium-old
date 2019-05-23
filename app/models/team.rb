require 'united_states'

class Team < ApplicationRecord
  enum subdivision: [:varsity, :junior_varsity]
  enum state: UnitedStates.postal_codes.map { |c| c.to_s.to_sym }
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

  # total team points earned from event scores and penalties
  def points
    scores.sum(&:points) + penalties.sum(&:points)
  end

  # number of first standings, second standings, third standings, etc.
  def standing_counts
    (1..(tournament.number_of_non_exhibition_teams + 2)).map do |p|
      scores.count { |s| s.points == p }
    end
  end
end
