class Event < ApplicationRecord
  enum scoring: [:high, :low]

  has_many :scores
  belongs_to :tournament

  validates :name, presence: true

  # Contains the placing information wihout exhibition teams included
  def standings
    groups = []
    ungrouped_scores = scores

    groups[6], ungrouped_scores = ungrouped_scores.partition{ |score| score.disqualified }
    groups[5], ungrouped_scores = ungrouped_scores.partition{ |score| !score.participated }
    groups[4], ungrouped_scores = ungrouped_scores.partition{ |score| score.score.nil? }

    groups[3], ungrouped_scores = ungrouped_scores.partition{ |score| score.tier == 4 }
    groups[2], ungrouped_scores = ungrouped_scores.partition{ |score| score.tier == 3 }
    groups[1], ungrouped_scores = ungrouped_scores.partition{ |score| score.tier == 2 }
    groups[0] = ungrouped_scores

    # Holds arrays of [placing, score]
    standings = []
    placing = 1
    for tier in 0..3
      groups[tier].sort_by!{ |score| score.score }
      groups[tier].reverse! if(scoring == :high)

      groups[tier].each do |score|
        next if score.team.exhibition
        standings << [placing, score]
        placing = placing + 1
      end
    end

    groups[4].each do |score|
      standings << [tournament.number_of_competing_teams, score]
    end

    groups[5].each do |score|
      standings << [1 + tournament.number_of_competing_teams, score]
    end

    groups[6].each do |score|
      standings << [2 + tournament.number_of_competing_teams, score]
    end

    standings
  end

  def placing(team_number)
    team_standing = standings.select{ |standing| standing[1].team.number == team_number }
    # Error is team not found, uncaught
    team_standing[0][0]
  end

end
