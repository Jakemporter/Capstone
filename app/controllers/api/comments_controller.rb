class Api::CommentsController < ApplicationController
  before_action :authenticate_user

  def create
    current_car = Car.find_by(id: params[:car_id])
    comment = Comment.new(
      user_id: current_user.id,
      car_id: current_car.id,
      comment: params[:comment],
    )
    if comment.save
      render json: {car: current_car, comment: comment}
    end 
  end
end
