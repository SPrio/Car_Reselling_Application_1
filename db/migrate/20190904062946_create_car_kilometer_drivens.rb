class CreateCarKilometerDrivens < ActiveRecord::Migration[5.2]
  def change
    create_table :car_kilometer_drivens do |t|
      t.string :range

      t.timestamps
    end
  end
end
