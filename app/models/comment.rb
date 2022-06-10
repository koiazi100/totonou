class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :hot_spring
  has_many_attached :images
  has_many :likes, dependent: :destroy

  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end
end
