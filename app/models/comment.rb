class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :hot_spring
  has_many_attached :images
end
