class User < ApplicationRecord
  has_many :admin_roles
  has_many :tournaments, through: :admin_roles

  has_many :event_supervisor_roles
  has_many :events, through: :event_supervisor_roles

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates_uniqueness_of :email

  def full_name
    "#{first_name} #{last_name}"
  end
end
