class Api::CategoryController < ApplicationController
  before_action :authenticate_admin
  def create
    category = Category.new(
      name: params[:name],
    )
    if category.save
      category_car = CategoryCar.create(
        category_id: category.id
      )
    else 
      render json: {errors: category_car.errors.full_messages}
    end
    render json: {message: "category created"}
  end
end
