class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :review

  validates :vote, :user_id, :review_id, presence: true

end
