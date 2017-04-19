class Review < ApplicationRecord
  belongs_to :user
  belongs_to :motorcycle

  validates :title, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 20 }

  def username
    User.find(user_id).username
  end

end
