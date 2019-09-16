class CarRegistrationStatesController < ApplicationController
  before_action :get_car_registration_state, except: [:index, :new, :create]

  def index
    @car_registration_states = CarRegistrationState.all
  end

  def show
  end

  def new
    @car_registration_state = CarRegistrationState.new
  end

  def edit 
  end

  def create
    @car_registration_state = CarRegistrationState.new(car_registration_state_params)
    if @car_registration_state.save
      generate_flash "Car registration state has been succesfully created"
      redirect_to @car_registration_state
    else
      generate_flash "Failed to create Car registration state"
      render "new"
    end
  end

  def update 
    if @car_registration_state.update(car_registration_state_params)
      generate_flash "Car registration state has been succesfully Updated"
      redirect_to car_registration_states_path
    else
      generate_flash "Failed to update Car registration state"
      render "edit"
    end
  end

  def destroy
    @car_registration_state.destroy
    generate_flash "Car registration state has been succesfully destroyed"
    redirect_to car_registration_states_path
  end

  def generate_flash(msg)
    flash[:notice] = msg
  end

  def get_car_registration_state
    @car_registration_state = CarRegistrationState.find(params[:id])
  end

  private
    def car_registration_state_params
      params.require(:car_registration_state).permit(:name)     
    end
end
