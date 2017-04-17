class Style < ApplicationRecord
  validates :style, presence: true
  validates :style, uniqueness: true


end
