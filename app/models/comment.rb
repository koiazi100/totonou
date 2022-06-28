class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :hot_spring
  has_many_attached :images, dependent: :destroy
  has_many :comments_likes

  
end
