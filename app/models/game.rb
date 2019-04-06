class Game < ApplicationRecord
  has_one_attached :photo

  has_many :category_games, dependent: :destroy
  has_many :game_platforms, dependent: :destroy
  has_many :game_users, dependent: :destroy

  validates :name, :release_year, presence: true
  validates :release_year, numericality: true
end
