class Review < ApplicationRecord
  belongs_to :user
  belongs_to :motorcycle
  has_many :votes

  validates :title, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 20 }

  def username
    User.find(user_id).username
  end

  def score
    x = 0
    votes = Vote.where(review_id: id)
    votes.each do |v|
      x += v.vote
    end
    x
  end

  def already_voted?(current_user)
    if current_user
      if Vote.where(user_id: current_user.id, review_id: id).empty?
        return false
      else
        return Vote.where(user_id: current_user.id, review_id: id)[0].vote
      end
    else
      "Not logged in"
    end
  end


end
