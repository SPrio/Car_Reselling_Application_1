class CreateCarRegistrationStates < ActiveRecord::Migration[5.2]
  def change
    create_table :car_registration_states do |t|
      t.string :name

      t.timestamps
    end
  end
end
