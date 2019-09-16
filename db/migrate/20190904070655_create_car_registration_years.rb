class CreateCarRegistrationYears < ActiveRecord::Migration[5.2]
  def change
    create_table :car_registration_years do |t|
      t.string :start
      t.string :end

      t.timestamps
    end
  end
end
