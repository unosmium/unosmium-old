class Penalty < ApplicationRecord
  belongs_to :team

  validates :team_id, presence: true
  validates :points, presence: true,
                     numericality: { greater_than: 0 }
end
