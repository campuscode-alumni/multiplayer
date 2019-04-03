class User < ApplicationRecord
  belongs_to :city, optional: true
  belongs_to :state, optional: true
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  validates :name, presence: true
  validates :nickname, presence: true
end
