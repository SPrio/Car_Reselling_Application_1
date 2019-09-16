# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
places = {
  'BR' => 'Patna',
  'JH' => 'Ranchi',
  'DL' => 'Delhi', 
  'WB' => 'Kolkata',
  'RJ' => 'Jaipur',
  'MH' => 'Mumbai'
}
brands = {
 'Honda' => 'City',
 'Toyota' => 'Etios',
 'Ford' => 'Figo',
 'Maruti Suzuki' => 'Alto',
 'Tata' => 'Indigo'
}
10.times do
  #fbrand = Faker::Vehicle.make
  #fmodel = Faker::Vehicle.model(make_of_model: fbrand)
  state = ['BR','JH','DL','WB','RJ','MH'].sample 
  city = places[state]
  brand = ['Honda','Toyota','Ford','Maruti Suzuki','Tata' ].sample
  model= brands[brand]
  Car.create(
   city: city,
   brand: brand,
   model:  model,
   registration_year: Faker::Vehicle.year,
   variant: Faker::Vehicle.fuel_type,
   registration_state: state,
   condition: 'Fair',
   user_id: 1,
   kilometer_driven:   ['Upto 10000 km', '10000-20000 km', '20000-40000 km', '40000-60000 km'].sample
  )
end