class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :review

  validates :user_id, :review_id, presence: true
  validates :vote, inclusion: { in: [true, false] }



end
