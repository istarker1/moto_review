class Motorcycle < ApplicationRecord
  belongs_to :user
  belongs_to :style

  validates :make, :model, presence: true
  validates :model, uniqueness: true

  def type
    style.style
  end

  def creator
    User.find(user_id)
  end

end
