class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

with_options presence: true do
  validates :nickname
  validates :sex_id
end
  validates :sex_id, numericality: { other_than: 1, message: "を選択してください" }, allow_blank: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :sex
end
