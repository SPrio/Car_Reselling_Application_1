class CarCostsController < ApplicationController
  before_action :get_car_cost, except: [:index, :new, :create]

  def index
    @car_costs = CarCost.all
  end

  def show
  end

  def new
    @car_cost = CarCost.new
  end

  def edit
  end

  def create
    @car_cost = CarCost.new(car_cost_params)
    if @car_cost.save
      generate_flash "Car Cost has been succesfully created"
      redirect_to @car_cost
    else
      generate_flash "Failed to create Car cost"
      render "new"
    end
  end

  def update 
    if @car_cost.update(car_cost_params)
      generate_flash "Car Cost has been succesfully Updated"
      redirect_to car_costs_path
    else
      generate_flash "Failed to update Car Cost"
      render "edit"
    end
  end

  def destroy
    @car_cost.destroy
    generate_flash "Car Cost has been succesfully destroyed"
    redirect_to car_costs_path
  end

  def generate_flash(msg)
    flash[:notice] = msg
  end

  def get_car_cost
    @car_cost = CarCost.find(params[:id])
  end

  private
    def car_cost_params
      params.require(:car_cost).permit(:condition, :cost)     
    end
end
