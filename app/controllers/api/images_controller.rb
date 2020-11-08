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

  def update
    @image = Image.find_by(id: params[:id])
    if @image
      @image.url = params[:url] || @image.url
      if @image.save
        render json: {success: "Image updated"}
      else 
        render json: {errors: "Error saving image"}
      end
    else
      render json: {errors: ["image not found"]}, status: 422
    end
  end

  def destroy
    image = Image.find_by(id: params[:id])
    if image
      image.destroy
      image.save
      render json: {sucess: "Image Deleted"}
    else
      render json: {errors: ["Image not found"]}, status: 422
    end
  end
end
