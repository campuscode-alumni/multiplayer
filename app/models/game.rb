class Game < ApplicationRecord
  has_one_attached :photo
  has_many :category_games, dependent: :delete_all
  has_many :game_platforms, dependent: :delete_all

  validates :name, :release_year, presence: true
  validates :release_year, numericality: true
end
