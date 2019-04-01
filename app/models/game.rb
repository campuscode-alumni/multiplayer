class Game < ApplicationRecord
  has_one_attached :photo
  has_many :category_games
  has_many :game_platforms

  validates :name, :release_year, presence: true
  validates :release_year, numericality: true
end
