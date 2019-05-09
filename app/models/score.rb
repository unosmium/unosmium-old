class Score < ApplicationRecord
  belongs_to :event
  belongs_to :team

  # tier: The tier of the team. Integer > 0
end
