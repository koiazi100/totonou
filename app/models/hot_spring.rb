class HotSpring < ApplicationRecord
  belongs_to :user
  has_one :man_sauna
  has_one :woman_sauna
  has_one_attached :image
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end
  
end
