class Car < ApplicationRecord
  has_many :bids
  belongs_to :user
  has_many :images
  has_many :comments
  has_many :category_cars
  has_many :categories, through: :category_cars
  def expired?
    return created_at < 2.weeks.ago
  end

  def friendly_created_at
    created_at.strftime("%B%e, %Y")
  end

  def expires
    string = created_at + 2.weeks
    return string.strftime("%I:%M %p %B %e, %Y")
  end

end