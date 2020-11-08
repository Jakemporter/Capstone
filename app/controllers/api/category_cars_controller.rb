class Api::CategoryCarsController < ApplicationController
  before_action :authenticate_admin
  def create
    category_car = CategoryCar.new(
      category_id: params[:category_id],
      car_id: params[:car_id],
    )
    if category_car.save
      render json: {success: "Added car to category"}
    else
      render json: {errors: ["error during save"]}
    end

  end
end
