FactoryBot.define do
  factory :event do
    name { "Test Event" }
    trial { false }
    trialed { false }
    scoring { 0 }
  end
end