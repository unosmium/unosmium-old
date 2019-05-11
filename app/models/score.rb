class Score < ApplicationRecord
  belongs_to :event
  belongs_to :team

  # validates :participated
  # validates :disqualified
  # validates :score
  # validates :tiebreaker_place
  # validates :tier

  # tier: The tier of the team. Integer > 0
end
