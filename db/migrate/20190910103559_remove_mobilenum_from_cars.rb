class RemoveMobilenumFromCars < ActiveRecord::Migration[5.2]
  def change
    remove_column :cars, :mobilenum, :string
  end
end
