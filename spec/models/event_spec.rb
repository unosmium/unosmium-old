require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'event#standings' do
    let(:t) { create(:completed_tournament) }
    it 'has standings in ascending order' do
      event = t.events[0]
      expect(event.standings.map{ |standing| standing[0] }).to eq((1..10).to_a)
    end

    it 'has standings sort scores' do 
      event = t.events[0]
      sorted_scores = event.scores.sort_by{ |score| score.score}.reverse
      expect(event.standings.map{ |standing| standing[1] }).to eq(sorted_scores)
    end

    it 'has DQs as tournament_size + 2' do
      event = t.events[0]
      allow(event.scores[5]).to receive(:disqualified).and_return(true)
      expect(event.standings.map{ |standing| standing[0] }[9]).to eq(t.number_of_teams + 2)
    end

    it 'has no shows as tournament_size + 1' do
      event = t.events[0]
      allow(event.scores[5]).to receive(:participated).and_return(false)
      expect(event.standings.map{ |standing| standing[0] }[9]).to eq(t.number_of_teams + 1)
    end

    it 'has participation without points as tournament_size' do
      event = t.events[0]
      allow(event.scores[5]).to receive(:participated).and_return(true)
      allow(event.scores[5]).to receive(:score).and_return(nil)
      allow(event.scores[4]).to receive(:participated).and_return(true)
      allow(event.scores[4]).to receive(:score).and_return(nil)

      expect(event.standings.map{ |standing| standing[0]}[8]).to eq(t.number_of_teams)
    end

    it 'works with low score wins events' do
      event = t.events[0]
      allow(event).to receive(:scoring).and_return(1)
      for i in 0..8
        expect(event.standings[i][1].score).to be < (event.standings[i+1][1].score)
      end
    end
  end

  describe 'event#placing' do
    let(:t) { create(:completed_tournament) }
    it 'returns the correct placing' do
      event = t.events[0]
      sorted_scores = event.scores.sort_by{ |score| score.score}.reverse
      team = sorted_scores[5].team.number
      expect(event.placing(team)).to eq(5+1)
    end
  end
end
