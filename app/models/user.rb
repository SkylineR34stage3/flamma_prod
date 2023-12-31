class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  before_validation :set_slug, on: :create

  has_many :posts

  validates :nickname, :email, :name, :surname, presence: true
  validates :email, uniqueness: true
  validates :slug, uniqueness: true
  validates :role, :status, presence: true

  enum role: { user: 0, admin: 1 }
  enum status: { pending_verification: 0, verified: 1, banned: 2, rejected: 3 }

  def verify
    update(status: :verified)
  end

  def ban
    update(status: :banned)
  end

  def decline
    update(status: :rejected)
  end

  private

  def set_slug
    self.slug = nickname.parameterize
  end
end
