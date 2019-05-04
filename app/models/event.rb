class Event < ApplicationRecord
  enum scoring: [:high, :low]
end
