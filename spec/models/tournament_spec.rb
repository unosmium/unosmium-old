require 'rails_helper'

RSpec.describe Tournament, type: :model do
  it 'return tournament size' do
    t = create(:filled_tournament)
    expect(t.number_of_teams).to eq(10)
  end

  it 'returns correct winning team' do
    t = create(:completed_tournament)
    winning_team = t.teams[4]
    winning_team.scores.map{ |score| score.update(score: 100) }
    expect(t.standings[0].number).to eq(winning_team.number)
  end

  it 'teams are sorted by low points' do
    t = create(:completed_tournament)
    expect(t.standings).to eq(t.teams.sort_by(&:points))
  end
end
