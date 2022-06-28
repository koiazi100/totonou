class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 has_one_attached :image, dependent: :destroy
 has_many :comments, dependent: :destroy
 has_many :likes
 has_many :comments_likes
 has_many :hot_springs
with_options presence: true do
  validates :nickname
  validates :sex_id
end
  validates :sex_id, numericality: { other_than: 1, message: "を選択してください" }, allow_blank: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :sex

  def liked_by?(hot_spring_id)
    likes.where(hot_spring_id: hot_spring_id).exists?
  end

  def comments_liked_by?(comment_id)
    comments_likes.where(comment_id: comment_id).exists?
  end
end
