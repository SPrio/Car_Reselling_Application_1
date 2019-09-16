class AddMobilenumToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :mobilenum, :string
  end
end
