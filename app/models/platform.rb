class Platform < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
