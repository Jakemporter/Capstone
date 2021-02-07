require 'dotiw'

include ActionView::Helpers::DateHelper
include ActionView::Helpers::TextHelper
include ActionView::Helpers::NumberHelper


class Car < ApplicationRecord
  has_many :bids
  belongs_to :user
  has_many :images
  has_many :comments
  has_many :category_cars
  has_many :categories, through: :category_cars
  def expired?
    return expires_at < Time.now
  end

  def friendly_created_at
    created_at.strftime("%B%e, %Y")
  end

  def expires
    string = created_at + 2.weeks
    return string.strftime("%I:%M %p %B %e, %Y")
  end


  def time_left
    return distance_of_time_in_words(Time.now, created_at + 2.weeks)  
  end

  def expires_at
    return created_at + 2.weeks
  end

end