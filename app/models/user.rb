class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :sex, presence: true,numericality:{ other_than: 1, message: "を選択してください" }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :sex
end
