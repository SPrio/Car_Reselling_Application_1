class CarsController < ApplicationController
  before_action :get_car, except: [:index, :new, :create]
  before_action :authenticate_user!

  def index
    @cars = Car.where(user_id: current_user.id)
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
    @car.user_id = current_user.id
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
    if params[:phone] == User.find(current_user.id).number
      #@car = Car.find(params[:id])
      #@user = User.find(@car.user_id)
      #@user.save
      @price = CarCost.where(condition: @car.condition).pluck(:cost)
      render 'quotation'
    else
      generate_flash "The phone number is different from the saved one"
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
    generate_flash "your appointment status is in process"
    UserMailer.statusupdate( User.find(@appointment.user_id).email, @appointment.status ).deliver
    redirect_to home_index_path

  end
  def generate_flash(msg)
    flash[:notice] = msg
  end

  def get_car 
    @car = Car.find(params[:id])
  end

  private
    def car_params
      params.require(:car).permit(:city,:brand,:model,:registration_year,:variant,:registration_state,:kilometer_driven, :condition)     
    end
end
