class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  
  has_many :cars
  has_many :bids
  has_many :comments
end
