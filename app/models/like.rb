class Like < ApplicationRecord
  belongs_to :user
  belongs_to :hot_spring
  belongs_to :comment
end
