class Api::BidsController < ApplicationController
  before_action :authenticate_user, except: [:show]
  
  def create
    current_car = Car.find_by(id: params[:car_id])
    bid = Bid.new(
      car_id: current_car.id,
      user_id: current_user.id,
      bid: params[:bid], 
    )
    if bid.bid > current_car.current_bid
      current_car.current_bid = bid.bid
      current_car.save
    end
    render json: {currentBid: current_car}
  end
  
  def show
    
  end
end
