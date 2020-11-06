class Api::ImagesController < ApplicationController
  before_action :authenticate_user
  def create
    current_car = Car.find_by(id: params[:car_id])
    if current_car
      new_image = Image.new(
        car_id: current_car.id,
        url: params[:url],
      )
      if new_image
        new_image.save
        render json: {message: "Image created"}
      else
        render json: {message: "Image creation failed"}, status: 422
      end
    else
      render json: {error: "car not found"}
    end
  end
end
