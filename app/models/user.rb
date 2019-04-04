class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :game_users
  has_many :games, through: :game_users, dependent: :destroy
  has_many :game_platforms, through: :games

  validates :name, presence: true
end
