class Car < ApplicationRecord
  has_many :bids
  belongs_to :user
  has_many :images
  has_many :comments
  has_many :category_cars
  has_many :categories, through: :category_cars
  def expired
    return created_at < 1.day.ago
  end

end