class Api::BidsController < ApplicationController
  before_action :authenticate_user, except: [:show]

  def index
    @bids = Bid.where(user_id: current_user.id)
    @bids = @bids.order(bid: :desc)
    render "index.json.jb"
  end

  
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
        render json: {
          id: bid.id,
          bid: bid.bid,
          user_id: current_user.id,
          user: bid.user.username
        }
      else
        render json: {errors: ["bid must be higher than #{current_car.current_bid}"]}, status: 422
      end
    else
      render json: {error: "Car not found"}
    end
  end 

  def show
    bid = Bid.find_by(id: params[:id])
    render json: {bid: bid, car: bid.car}
  end
end
