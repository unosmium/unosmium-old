class Event < ApplicationRecord
  enum scoring: [:high, :low]

  has_many :scores
  belongs_to :tournament

  validates :name, presence: true
  # validates :trial
  # validates :trialed
  validates :scoring, presence: true

  validates_uniqueness_of :name, scope: :tournament_id

  # sorted relation of scores
  def placings
    score_ordering = low? ? :asc : :desc

    scores.order(disqualified: :asc)
          .order(participated: :desc)
          .order(tier: :asc)
          .order(score: score_ordering)
          .order(tiebreaker_place: :asc)
  end

  # sorted scores without exhibition teams
  def standings
    placings.reject { |p| p.team.exhibition? }
  end

  # sorted scores without exhibition teams except for the one specified
  def standings_including(team)
    placings.reject { |p| p.team.exhibition? && p.team != team }
  end
end
