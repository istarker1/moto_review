class User < ApplicationRecord
  has_many :motorcycles
  has_many :votes

  validates :first_name, :last_name, :username, presence: true
  validates :username, uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
