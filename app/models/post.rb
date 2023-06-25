class Post < ApplicationRecord
  belongs_to :user

  validates :slug, presence: true, uniqueness: true
  validates :last_activity, presence: true
  validates :post_type, presence: true
  validates :comment_count, presence: true, numericality: { only_integer: true }
  validates :rating, presence: true, numericality: { only_integer: true }
  validates :is_commentable, inclusion: { in: [true, false] }
  validates :is_visible, inclusion: { in: [true, false] }
  validates :is_draft, inclusion: { in: [true, false] }
end
