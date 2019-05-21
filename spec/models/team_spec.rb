require 'rails_helper'

RSpec.describe Team, type: :model do
  describe 'team#score' do
    let(:t) { create(:completed_tournament)}

    it 'returns sum of team placings' do
      team = t.teams[1]
      team.scores.map{ |score| score.update(score: 101) }

      expect(team.score).to eq(10)
    end

    it 'returns sum of team placings x2' do
      team = t.teams[1]
      team.scores.map{ |score| score.update(score: 0) }

      expect(team.score).to eq(100)
    end
  end
end
