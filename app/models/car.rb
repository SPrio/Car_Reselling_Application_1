require 'elasticsearch/model'

class Car < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  def as_indexed_json(options = {})
    self.as_json(
      only: [:city, :brand, :model, :registration_year, :variant, :registration_state, :kilometer_driven, :condition]
      
    )
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

  def self.search1(city, brand, model, registration_year, variant, registration_state, kilometer_driven )
    where( "city LIKE ? AND brand LIKE ? AND model LIKE ? AND registration_year LIKE ? AND variant LIKE ? AND registration_state LIKE ? AND kilometer_driven LIKE ?", "%#{city}%", "%#{brand}%", "%#{model}%", "%#{registration_year}%", "%#{variant}%", "%#{registration_state}%", "%#{kilometer_driven}%" )
  end
end

#Car.import