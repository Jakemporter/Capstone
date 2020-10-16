class CategoryCar < ApplicationRecord
  belongs_to :category
  belongs_to :car, optional: true
end
