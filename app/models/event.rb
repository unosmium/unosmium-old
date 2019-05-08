class Event < ApplicationRecord
  enum scoring: [:high, :low]

  belongs_to :tournament
end
