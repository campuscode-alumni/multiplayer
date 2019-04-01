class Game < ApplicationRecord
  has_one_attached :photo

  validates :name, :release_year, presence: true
  validates :release_year, numericality: true
end
