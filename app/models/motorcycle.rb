class Motorcycle < ApplicationRecord
  validates :make, :model, presence: true
  validates :model, uniqueness: true

end
