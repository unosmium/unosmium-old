FactoryBot.define do
  factory :tournament do
    location { "Testing Site" }
    level { 0 }
    division { 1 }
    year { 2019 }
    date { Date.today }

    factory :filled_tournament do
      after(:create) do |t|
        for ind in 1..10 do
          create(:event, name: "Event #{ind}",tournament: t)
          create(:team, school: "School #{ind}", number: ind, tournament: t)
        end
      end

      factory :completed_tournament do
        after(:create) do |t|
          t.teams.each do |team|
            t.events.each do |event|
              create(:score, team: team, event: event)
            end
          end
        end
      end
    end
  end
end
