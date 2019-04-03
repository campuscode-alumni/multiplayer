class Event < ApplicationRecord
  belongs_to :user
  belongs_to :game_platform
end
