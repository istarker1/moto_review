class Motorcycle < ApplicationRecord
  belongs_to :user
  belongs_to :style
  has_many :reviews

  validates :make, :model, presence: true
  validates :model, uniqueness: true

  def type
    style.style
  end

  def creator
    User.find(user_id)
  end

  def already_reviewed?(current_user)
    if current_user
      !reviews.where(user_id: current_user.id).empty?
    else
      false
    end
  end

end
