class User < ApplicationRecord
  has_many :roles
  has_many :tournaments, through: :roles

  def full_name
    "#{first_name} #{last_name}"
  end
end