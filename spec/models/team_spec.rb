require 'rails_helper'

RSpec.describe Team, type: :model do
  describe 'team#points' do
    let(:t) { create(:completed_tournament)}

    it 'returns sum of team placings without penalties' do
      team = t.teams[1]
      team.scores.map{ |score| score.update(score: 101) }

      expect(team.points).to eq(10)
    end
  end
end
