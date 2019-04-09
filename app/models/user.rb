class User < ApplicationRecord
  belongs_to :city, optional: true
  belongs_to :state, optional: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :game_users, dependent: :destroy
  has_many :games, through: :game_users, dependent: :destroy
  has_many :game_platforms, through: :games
  has_many :events, dependent: :destroy

  has_one_attached :avatar

  validates :name, presence: true
  validates :nickname, presence: true, on: :update
  validates :nickname, uniqueness: true, on: :update

  def event_options
    events.map { |e| [e.title, e.id] }
  end
end
