require 'united_states'

class Team < ApplicationRecord
  enum subdivision: [:varsity, :junior_varsity]
  enum state: UnitedStates.postal_codes.map(&:to_s).map(&:to_sym)

  belongs_to :tournament
end
