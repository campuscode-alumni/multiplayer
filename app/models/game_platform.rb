class GamePlatform < ApplicationRecord
  belongs_to :game
  belongs_to :platform

  private

  def game_and_platform
    "#{game.name} - #{platform.name}"
  end
end
