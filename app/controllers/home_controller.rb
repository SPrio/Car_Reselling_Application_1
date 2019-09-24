#require 'pry'
class HomeController < ApplicationController
  def index
  end
  def filter_search
    if params[:search].nil?
      @cars = Car.all
    else
      @cars = Car.filtered_search(params[:search],params[:city],params[:brand],params[:model],params[:registration_year],params[:variant],params[:registration_state],params[:kilometer_driven])
      render 'filter_search'
     end
    #@cars = Car.search1(params[:city],params[:brand],params[:model],params[:registration_year],params[:variant],params[:registration_state],params[:kilometer_driven])
    
    # response = Car.__elasticsearch__.search(
    #   query: {
    #     multi_match: {
    #       query: params[:query],
    #       fields: [:city, :brand, :model, :registration_year, :variant, :registration_state, :kilometer_driven, :condition]
    #     }
    #   }
    # ).results

    # render json: {
    #   results: response.results,
    #   total: response.total
    # } 
  end
  def places
    @places = CarCity.all
    
  end
  private
    def search_params
      #params.require(:cars).permit(:city, :brand,:model,:registration_year,:variant,:registration_state,:kilometer_driven, :search)     
    end
end
