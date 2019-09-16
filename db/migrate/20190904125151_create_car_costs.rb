class CreateCarCosts < ActiveRecord::Migration[5.2]
  def change
    create_table :car_costs do |t|
      t.string :condition
      t.string :cost

      t.timestamps
    end
  end
end
