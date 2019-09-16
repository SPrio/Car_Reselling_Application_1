class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string :city
      t.string :brand
      t.string :model
      t.string :registration_year
      t.string :variant
      t.string :registration_state
      t.string :kilometer_driven

    end
  end
end
