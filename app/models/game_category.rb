class GameCategory < ApplicationRecord
    validates :name, presence: true
end
