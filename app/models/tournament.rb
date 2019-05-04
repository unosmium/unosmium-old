class Tournament < ApplicationRecord
  enum level: [:Invitational, :States, :Nationals]
  enum division: [:A, :B, :C]
end
