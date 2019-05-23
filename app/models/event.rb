class Event < ApplicationRecord
  enum scoring: [:high, :low]

  has_many :scores
  has_one :event_supervisor_role
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

  # groups of tied scores, may exist in between raw score entry and tiebreaking
  def ties
    placings.select { |s| s.participated? && !s.disqualified? }
            .group_by { |s| [s.tier, s.score, s.tiebreaker_place] }
            .values
            .reject { |g| g.size == 1 }
  end
end
