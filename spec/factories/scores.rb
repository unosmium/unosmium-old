FactoryBot.define do
  factory :score do
    participated { true }
    disqualified { false }
    score { 100*rand() }
    tiebreaker_place { 1 }
    tier { 1 }

    factory :disqualfied_score do
      disqualified { true }
    end

    factory :no_show_score do 
      participated { false }
    end 

    factory :no_points_score do
      score { nil }
    end
  end
end
