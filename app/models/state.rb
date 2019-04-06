class State < ApplicationRecord
  has_many :cities, dependent: :restrict_with_exception
end
