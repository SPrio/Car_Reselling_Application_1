class CarsController < ApplicationController
  before_action :get_car, except: [:index, :new, :create]

  def index
    @cars = Car.all
  end

  def show
  end

  def new
    @car = Car.new
    
  end

  def edit 
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      generate_flash "Car has been succesfully created"
      redirect_to @car
    else
      generate_flash "Failed to create Car"
      render "new"
    end
  end

  def update 
    if @car.update(car_params)
      generate_flash "Car has been succesfully Updated"
      redirect_to cars_path
    else
      generate_flash "Failed to update Car"
      render "edit"
    end
  end

  def destroy
    @car.destroy
    generate_flash "Car has been succesfully destroyed"
    redirect_to cars_path
  end

  def quotation
    @price = nil
    if params[:phone]
      @price = CarCost.where(condition: @car.condition).pluck(:cost)
      render 'quotation'
    end

  end
  def appointment 
    @car = Car.find(params[:id])
    @appointment = Appointment.new
    @appointment.user_id = @car.user_id
    @appointment.car_id = @car.id
    @appointment.status = "in process"
    @appointment.save!
    Notification.create(recipient: current_user, action: "Your appointment status is #{@appointment.status}", notifiable: @appointment)
    generate_flash "your appointment is in process"
    redirect_to car_path(@car)

  end
  def generate_flash(msg)
    flash[:notice] = msg
  end

  def get_car 
    @car = Car.find(params[:id])
  end

  private
    def car_params
      params.require(:car).permit(:city,:brand,:model,:registration_year,:variant,:registration_state,:kilometer_driven, :condition, :mobilenum)     
    end
end
