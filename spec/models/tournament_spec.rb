require 'rails_helper'

RSpec.describe Tournament, type: :model do
  it 'return tournament size' do
    t = create(:filled_tournament)
    expect(t.number_of_teams).to eq(10)
  end

  it 'returns final standings' do
    t = create(:completed_tournament)
    winning_team = t.teams[4]
    winning_team.scores.map{ |score| score.update(score: 0) }
    expect(t.final_standings[0].number).to eq(winning_team.number)
  end

  it 'returns final standings v2' do
    t = create(:completed_tournament)
    expect(t.final_standings[0].score).to be < t.final_standings[1].score
  end

end