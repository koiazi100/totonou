class HotSpring < ApplicationRecord
  belongs_to :user
  has_one :man_sauna, dependent: :destroy
  has_one :woman_sauna, dependent: :destroy
  has_one_attached :image, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  
end
