class HomeController < ApplicationController
  def index
  end
  def filter_search
    @cars = Car.search1(params[:city],params[:brand],params[:model],params[:registration_year],params[:variant],params[:registration_state],params[:kilometer_driven])
    
    # response = Car.__elasticsearch__.search(
    #   query: {
    #     multi_match: {
    #       query: params[:query],
    #       fields: ['model', 'brand', 'variant']
    #     }
    #   }
    # ).results
    # print response
    # render json: {
      
    #     results: response.results,
    #     total: response.total
    # }
    
    #print @cars
    #(:city, :brand,:model,:registration_year,:variant,:registration_state,:kilometer_driven)
    #if @cars
  end
  private
    def search_params
      #params.require(:cars).permit(:city, :brand,:model,:registration_year,:variant,:registration_state,:kilometer_driven)     
    end
end
