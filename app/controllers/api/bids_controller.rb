class Api::BidsController < ApplicationController
  before_action :authenticate_user, except: [:show]
  
  def create
    current_car = Car.find_by(id: params[:car_id])
    if current_car
      bid = Bid.new(
        car_id: current_car.id,
        user_id: current_user.id,
        bid: params[:bid], 
      )
      if bid.bid > current_car.current_bid
        bid.save
        current_car.current_bid = bid.bid
        current_car.save
      end
      render json: {current_bid: current_car.current_bid , current_car: current_car}
    else
      render json: {error: "Car not found"}
    end
  end 

  def show
    bid = Bid.find_by(id: params[:id])
    render json: {bid: bid, car: bid.car}
  end
end