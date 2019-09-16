class AddConditionToCars < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :condition, :string
  end
end
