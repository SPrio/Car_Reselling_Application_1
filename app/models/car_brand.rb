class CarBrand < ApplicationRecord
  has_many :car_models, dependent: :destroy
end
