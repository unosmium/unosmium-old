class User < ApplicationRecord
  has_many :roles
  has_many :tournaments, through: :roles
end