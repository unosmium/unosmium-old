class Event < ApplicationRecord
  enum scoring: [:high, :low]

  has_many :scores
  belongs_to :tournament
end
