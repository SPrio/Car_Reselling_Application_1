class CarModelsController < ApplicationController
  def create
    @car_brand = CarBrand.find(params[:car_brand_id])
    @car_model = @car_brand.car_models.create(car_model_params)
    redirect_to car_brand_path(@car_brand)
  end
 
  def destroy
    @car_brand = CarBrand.find(params[:car_brand_id])
    @car_model = @car_brand.car_models.find(params[:id])
    @car_model.destroy
    redirect_to car_brand_path(@car_brand)
  end
 
  private
    def car_model_params
      params.require(:car_model).permit(:name)
    end
end
