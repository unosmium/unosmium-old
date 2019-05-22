require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'event#standings' do
    let(:t) { create(:completed_tournament) }

    it 'has standings sort scores' do 
      event = t.events[0]
      sorted_scores = event.scores.sort_by{ |score| score.score}.reverse
      expect(event.standings).to eq(sorted_scores)
    end

    it 'excludes exhibition teams' do
      event = t.events[0]
      allow(event.scores[0].team).to receive(:exhibition).and_return(true)
      sorted_scores = event.scores.sort_by{ |score| score.score}.reject{ |s| s.team.exhibition? }.reverse
      expect(event.standings).to eq(sorted_scores)
    end
  end

  describe 'event#placing' do
    let(:t) { create(:completed_tournament) }

    it 'has standings sort scores' do 
      event = t.events[0]
      sorted_scores = event.scores.sort_by{ |score| score.score}.reverse
      expect(event.standings).to eq(sorted_scores)
    end
  end
end
