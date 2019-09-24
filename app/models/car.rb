require 'elasticsearch/model'

class Car < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  def as_indexed_json(options = {})
    self.as_json(
      only: [:city, :brand, :model, :registration_year, :variant, :registration_state, :kilometer_driven, :condition]
      
    )
  end

  def self.filtered_search(search, city, brand, model, registration_year, variant, registration_state, kilometer_driven)
	
	search_query =
		{
		query: {
		        bool: {
		            # must: {
		            #    multi_match: {
		            #         query: search,
		            #         fields: [:city, :brand, :model, :registration_year, :variant, :registration_state, :kilometer_driven]
		            #     	}
		            # 	}
		            # filter: {
		            # 	bool: {
		            #         must: {
		            #             match: { :city => city }
		            #         	}
		            #     	}
		            # }
		        	}
				}
			}
		

		filter_query = {		
		                bool: {
		                    should: [{
		                        # match: { :city => city }
		                    	}]

		                	}		            	
		            }

		#only search
		text_query= {
			multi_match: {
		                    query: search,
		                    fields: [:city, :brand, :model, :registration_year, :variant, :registration_state, :kilometer_driven]
		                	}
		}
		search_query[:query][:bool].store(:must, text_query) unless search.blank?

		#search and filter
		
		#print "city array ",cities
		unless registration_state.blank?
			registration_state.each do |r_s|
				registration_state_filter = { match:{ registration_state: r_s }}
				filter_query[:bool][:should] << registration_state_filter
			end
		end
		unless city.blank?
			city.each do |c|
				city_filter = { match:{ city: c}}
				filter_query[:bool][:should] << city_filter
			end
			end
		unless brand.blank?
			brand.each do |b|
				brand_filter = { match:{ brand: b }}
				filter_query[:bool][:should] << brand_filter
			end
			end
		unless model.blank?	
			model.each do |m|
				model_filter = { match:{ model: m }}
				filter_query[:bool][:should] << model_filter
			end
			end
		unless variant.blank?
			variant.each do |v|
				variant_filter = { match:{ variant: v }}
				filter_query[:bool][:should] << variant_filter 
			end
			end
		unless registration_year.blank?
			registration_year.each do |r_y|
				registration_year_filter = { match:{ registration_year: r_y }}
				filter_query[:bool][:should] << registration_year_filter
			end
			end
		unless kilometer_driven.blank?
			kilometer_driven.each do |k_d|
				kilometer_driven_filter = { match:{ kilometer_driven: k_d }}
				filter_query[:bool][:should] << kilometer_driven_filter
			end
			end


		#print "filter query ", filter_query

		# city_filter = { match:{ city: city}}
		# filter_query[:bool][:must] << city_filter unless city.blank?

		# brand_filter = { match:{ brand: brand }}
		# filter_query[:bool][:must] << brand_filter unless brand.blank?

		# model_filter = { match:{ model: model }}
		# filter_query[:bool][:must] << model_filter unless model.blank?

		# registration_year_filter = { match:{ registration_year: registration_year }}
		# filter_query[:bool][:must] << registration_year_filter unless registration_year.blank?

		# variant_filter = { match:{ variant: variant }}
		# filter_query[:bool][:must] << variant_filter unless variant.blank?

		# registration_state_filter = { match:{ registration_state: registration_state }}
		# filter_query[:bool][:must] << registration_state_filter unless registration_state.blank?

		# kilometer_driven_filter = { match:{ kilometer_driven: kilometer_driven }}
		# filter_query[:bool][:must] << kilometer_driven_filter unless kilometer_driven.blank?

		filter_query[:bool][:should].shift

		search_query[:query][:bool].store(:filter, filter_query)
		# unless ( city.blank? or brand.blank? or model.blank? or registration_year.blank? or variant.blank? or registration_state.blank? or kilometer_driven.blank? )

		#only filter

		#search_query[:query][:bool].store(:filter, filter_query) unless city.p?
		
		self.search(
			search_query
		)
		
		#  	self.search({
		#       "query": {
		#         "bool": {
		#             "must": {
		#                "multi_match": {
		#                     "query": search,
		#                     "fields": [:city, :brand, :model, :registration_year, :variant, :registration_state, :kilometer_driven]
		#                 	}
		#             	},
		#             "filter": {
		#                 "bool": {
		#                     "must": {
		#                         "match": { :city => city }
		#                     	}
		#                 	}
		#             	}
		#         	}
		# 		}
		
		# })
		

	end

  # settings do
  #   mappings dynamic: false do
  #     indexes :city, type: :text
  #     indexes :brand, type: :text, analyzer: :english
  #     indexes :model, type: :text, analyzer: :english
  #     indexes :registration_year, type: :text, analyzer: :english
  #     indexes :variant, type: :text, analyzer: :english
  #     indexes :registration_state, type: :text, analyzer: :english
  #     indexes :kilometer_driven, type: :text, analyzer: :english
  #     indexes :condition, type: :text, analyzer: :english
  #   end
  # end

  
end

#Car.import