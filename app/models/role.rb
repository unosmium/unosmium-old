class Role < ApplicationRecord
  belongs_to :tournament
  belongs_to :user

  validates :user_id, presence: true
  validates :tournament_id, presence: true
  validates_uniqueness_of :user_id, scope: :tournament_id
end