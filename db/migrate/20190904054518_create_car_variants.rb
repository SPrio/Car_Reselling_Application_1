class CreateCarVariants < ActiveRecord::Migration[5.2]
  def change
    create_table :car_variants do |t|
      t.string :name

      t.timestamps
    end
  end
end
