class Api::CarsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]
  def index
    @cars = Car.all
    render "index.json.jb"
  end

  def show
    @car = Car.find_by(id: params[:id])
    render "show.json.jb"
  end
  
  def create
    @car = Car.new(
      user_id: current_user.id,
      make: params[:make],
      model: params[:model],
      color: params[:color],
      year: params[:year],
      description: params[:description],
      miles: params[:miles],
    )

    if @car.save
      CategoryCar.create!(category_id: params[:category_id],
      car_id: @car.id)
      Image.create!(car_id: @car.id, url: params[:image_url])
    else
      render json: {errors: @car.errors.full_messages}, status: 422
    end
    render "show.json.jb"
  end

  def update
    @car = Car.find_by(id: params[:id])
    @car.make = params[:make] || @car.make
    @car.model = params[:model] || @car.model
    @car.color = params[:color] || @car.color
    @car.year = params[:year] || @car.year
    @car.description = params[:description] || @car.description
    @car.miles = params[:miles] || @car.miles
    if @car.save
      render "show.json.jb"
    else
      render json: {errors: @car.errors.full_messages} , status: 422
    end
  end

end
