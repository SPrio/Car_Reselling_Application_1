class CarCitiesController < ApplicationController
  before_action :get_car_city, except: [:index, :new, :create]

  def index
    @car_cities = CarCity.all
  end

  def show
  end

  def new
    @car_city = CarCity.new
  end

  def edit 
  end

  def create
    @car_city = CarCity.new(car_city_params)
    if @car_city.save
      generate_flash "Car City has been succesfully created"
      redirect_to @car_city
    else
      generate_flash "Failed to create Car city"
      render "new"
    end
  end

  def update 
    if @car_city.update(car_city_params)
      generate_flash "Car City has been succesfully Updated"
      redirect_to car_cities_path
    else
      generate_flash "Failed to update Car City"
      render "edit"
    end
  end

  def destroy
    @car_city.destroy
    generate_flash "Car City has been succesfully destroyed"
    redirect_to car_cities_path
  end

  def generate_flash(msg)
    flash[:notice] = msg
  end

  def get_car_city
    @car_city = CarCity.find(params[:id])
  end

  private
    def car_city_params
      params.require(:car_city).permit(:name)     
    end
end
