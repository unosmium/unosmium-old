class Tournament < ApplicationRecord
  enum level: [:Invitational, :Regionals, :States, :Nationals]
  enum division: [:A, :B, :C]
end
