class CarRegistrationYearsController < ApplicationController
  before_action :get_car_registration_year, except: [:index, :new, :create]

  def index
    @car_registration_years = CarRegistrationYear.all
  end

  def show
  end

  def new
    @car_registration_year = CarRegistrationYear.new
  end

  def edit 
  end

  def create
    @car_registration_year = CarRegistrationYear.new(car_registration_year_params)
    if @car_registration_year.save
      generate_flash "Car registration year has been succesfully created"
      redirect_to @car_registration_year
    else
      generate_flash "Failed to create Car registration year"
      render "new"
    end
  end

  def update 
    if @car_registration_year.update(car_registration_year_params)
      generate_flash "Car registration year has been succesfully Updated"
      redirect_to car_registration_years_path
    else
      generate_flash "Failed to update Car registration year"
      render "edit"
    end
  end

  def destroy
    @car_registration_year.destroy
    generate_flash "Car registration year has been succesfully destroyed"
    redirect_to car_registration_years_path
  end

  def generate_flash(msg)
    flash[:notice] = msg
  end

  def get_car_registration_year
    @car_registration_year = CarRegistrationYear.find(params[:id])
  end

  private
    def car_registration_year_params
      params.require(:car_registration_year).permit(:start, :end)     
    end
end
