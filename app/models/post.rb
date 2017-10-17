class Post < ApplicationRecord
  belongs_to :user
  validates :user_id, :content, presence: true
  validates :content, length: { maximum: 160 }
  default_scope -> {order(created_at: :desc)}
end
