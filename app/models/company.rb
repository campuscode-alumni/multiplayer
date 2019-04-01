class Company < ApplicationRecord
  has_one_attached :logo

  validates :name, presence: true, uniqueness: true
  validate :logo_validation

  def logo_validation
    if !logo.attached?
      errors[:logo] << 'Logo precisa ser enviado'
    end
  end
end
