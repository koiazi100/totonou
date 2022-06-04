class HotSpring < ApplicationRecord
  belongs_to :user
  has_one :man_sauna
  has_one :woman_sauna
  has_one_attached :image
  has_many :comments
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  
end
