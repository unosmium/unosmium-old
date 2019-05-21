class User < ApplicationRecord
  has_many :roles
  has_many :tournaments, through: :roles

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates_uniqueness_of :email

  def full_name
    "#{first_name} #{last_name}"
  end
end
