class CarKilometerDrivensController < ApplicationController
  before_action :get_car_kilometer_driven, except: [:index, :new, :create]

  def index
    @car_kilometer_drivens = CarKilometerDriven.all
  end

  def show
  end

  def new
    @car_kilometer_driven = CarKilometerDriven.new
  end

  def edit 
  end

  def create
    @car_kilometer_driven = CarKilometerDriven.new(car_kilometer_driven_params)
    if @car_kilometer_driven.save
      generate_flash "Car kilometer driven range has been succesfully created"
      redirect_to @car_kilometer_driven
    else
      generate_flash "Failed to create Car kilometer driven range"
      render "new"
    end
  end

  def update 
    if @car_kilometer_driven.update(car_kilometer_driven_params)
      generate_flash "Car kilometer driven has been succesfully Updated"
      redirect_to car_kilometer_drivens_path
    else
      generate_flash "Failed to update Car kilometer_driven"
      render "edit"
    end
  end

  def destroy
    @car_kilometer_driven.destroy
    generate_flash "Car kilometer driven has been succesfully destroyed"
    redirect_to car_kilometer_drivens_path
  end

  def generate_flash(msg)
    flash[:notice] = msg
  end

  def get_car_kilometer_driven
    @car_kilometer_driven = CarKilometerDriven.find(params[:id])
  end

  private
    def car_kilometer_driven_params
      params.require(:car_kilometer_driven).permit(:range)     
    end
end
