class Event < ApplicationRecord
  enum event_type: [:presential, :online]

  belongs_to :user
  belongs_to :game_platform
end
