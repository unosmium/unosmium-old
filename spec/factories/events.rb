FactoryBot.define do
  factory :event do
    name { "Test Event" }
    trial { false }
    trialed { false }
    scoring { 0 }

    factory :low_score_event do
      scoring { 1}
    end
  end
end
