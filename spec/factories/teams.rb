FactoryBot.define do
  factory :team do
    school { "Example School" }
    suffix { "Jr. "}
    subdivision { 0 }
    number { 1 }
    city { "Townsburg" }
    state { 19 }
  end
end