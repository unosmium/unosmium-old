require 'rails_helper'

RSpec.describe Tournament, type: :model do
  it 'return tournament size' do
    t = create(:filled_tournament)
    expect(t.number_of_teams).to eq(10)
  end

end