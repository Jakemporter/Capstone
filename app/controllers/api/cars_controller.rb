class Api::CarsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]
  def index
    @cars = Car.all
    if params[:category]
      category = Category.find_by(name: params[:category])
      @cars = category.cars
    end
    if params[:sort] == "bid" && params[:sort_order] == "asc"
      @cars = @cars.order(current_bid: :asc)
    elsif params[:sort] == "bid" && params[:sort_order] == "desc"
      @cars = @cars.order(current_bid: :desc)
    else
      @cars = @cars.order("id")
    end
    render "index.json.jb"
  end

  def show
    @car = Car.find_by(id: params[:id])
    if @car
      render "show.json.jb"
    else
      render json: {error: "Car not found"}
    end
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
    cars = Car.where(user_id: current_user.id) 
    @car = cars.find_by(id: params[:id])
    if @car
      @car.make = params[:make] || @car.make
      @car.model = params[:model] || @car.model
      @car.color = params[:color] || @car.color
      @car.year = params[:year] || @car.year
      @car.description = params[:description] || @car.description
      @car.miles = params[:miles] || @car.miles
      image = Image.find_by(url: @car.images[0]["url"])
      image["url"] = params[:url] || @car.images[0]["url"]
      image.save
    else
      render json: {error: "Car not found" }
    end
    if @car
      if @car.save
        render "show.json.jb"
      else
        render json: {errors: @car.errors.full_messages} , status: 422
      end
    end
  end

  def destroy
    cars = Car.where(user_id: current_user.id)
    car = cars.find_by(id: params[:id])
    if car
      images = Image.where(car_id: car.id)
      images.map do |image|
        image.destroy
        image.save
      end
      car.destroy
      car.save
      render json: {message: "Car successfully destroyed"}
    else
      render json: {message: "Car not found"}
    end
  end
end
