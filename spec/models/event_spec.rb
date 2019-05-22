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
      event.scores[0].team.update(exhibition: true)
      sorted_scores = event.scores.drop(1).sort_by{ |score| score.score }.reverse
      expect(event.standings).to eq(sorted_scores)
    end
  end

  describe 'event#placing' do
    let(:t) { create(:completed_tournament) }

    it 'has standings sort scores' do 
      event = t.events[0]
      sorted_scores = event.scores.sort_by{ |score| score.score}.reverse
      expect(event.placings).to eq(sorted_scores)
    end
  end
end
