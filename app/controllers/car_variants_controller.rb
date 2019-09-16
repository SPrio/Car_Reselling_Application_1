class CarVariantsController < ApplicationController
  before_action :get_car_variant, except: [:index, :new, :create]

  def index
    @car_variants = CarVariant.all
  end

  def show
  end

  def new
    @car_variant = CarVariant.new
  end

  def edit 
  end

  def create
    @car_variant = CarVariant.new(car_variant_params)
    if @car_variant.save
      generate_flash "Car variant has been succesfully created"
      redirect_to @car_variant
    else
      generate_flash "Failed to create Car variant"
      render "new"
    end
  end

  def update 
    if @car_variant.update(car_variant_params)
      generate_flash "Car variant has been succesfully Updated"
      redirect_to car_variants_path
    else
      generate_flash "Failed to update Car variant"
      render "edit"
    end
  end

  def destroy
    @car_variant.destroy
    generate_flash "Car variant has been succesfully destroyed"
    redirect_to car_variants_path
  end

  def generate_flash(msg)
    flash[:notice] = msg
  end

  def get_car_variant
    @car_variant = CarVariant.find(params[:id])
  end

  private
    def car_variant_params
      params.require(:car_variant).permit(:name)     
    end
end
