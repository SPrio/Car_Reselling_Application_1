class CarBrandsController < ApplicationController
  before_action :get_car_brand, except: [:index, :new, :create]

  def index
    @car_brands = CarBrand.all
  end

  def show
    
  end

  def new
    @car_brand = CarBrand.new
  end

  def edit 
  end

  def create
    @car_brand = CarBrand.new(car_brand_params)
    if @car_brand.save
      generate_flash "Car Brand has been succesfully created"
      redirect_to @car_brand
    else
      generate_flash "Failed to create Car Brand"
      render "new"
    end
  end
  def update 
    if @car_brand.update(car_brand_params)
      generate_flash "Car Brand has been succesfully Updated"
      redirect_to car_brands_path
    else
      generate_flash "Failed to update Car Brand"
      render "edit"
    end
  end

  def destroy
    @car_brand.destroy
    generate_flash "Car Brand has been succesfully destroyed"
    redirect_to car_brands_path
  end

  def generate_flash(msg)
    flash[:notice] = msg
  end

  def get_car_brand
    @car_brand = CarBrand.find(params[:id])
  end

  private
    def car_brand_params
      params.require(:car_brand).permit(:name)     
    end
end
