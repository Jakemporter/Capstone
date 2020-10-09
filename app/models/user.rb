class User < ApplicationRecord


  has_many :cars
  has_many :bids
  has_many :comments
end
