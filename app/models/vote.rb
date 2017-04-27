class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :review

  validates :user_id, :review_id, presence: true
  validates_inclusion_of :vote, in: -1..1

end
