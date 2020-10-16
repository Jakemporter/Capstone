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
  def destroy
    comments = Comment.where(user_id: current_user.id)
    comment = comments.find_by(id: params[:id])
    if comment
      comment.destroy
      comment.save
      render json: {success: "comment deleted"}
    else
      render json: {error: "comment not found"}
    end

  end
end
