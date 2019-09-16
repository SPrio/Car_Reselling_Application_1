class RemoveMobilenumFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :mobilenum, :string
  end
end
