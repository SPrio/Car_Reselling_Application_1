class AddMobilenumToCars < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :mobilenum, :string
  end
end
