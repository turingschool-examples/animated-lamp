def load_test_data
  @amusement_park_1 = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
  @amusement_park_2 = AmusementPark.create!(name: 'Hurricane Harbor', admission_cost: 50) 

  @ride_1 = @amusement_park_1.rides.create!(name: 'The Hurler', thrill_rating: 7, open: false)
  @ride_2 = @amusement_park_1.rides.create!(name: 'Big Swing', thrill_rating: 10, open: true)
  @ride_3 = @amusement_park_1.rides.create!(name: 'Coaster', thrill_rating: 4, open: true)


  @mechanic_1 = Mechanic.create!(name: 'Kara Smith', years_experience: 11)
  @mechanic_2 = Mechanic.create!(name: 'Steve Rogers', years_experience: 5)
  @mechanic_3 = Mechanic.create!(name: 'Old Jim', years_experience: 30)

  RideMechanic.create(ride: @ride_1, mechanic: @mechanic_1)
  RideMechanic.create(ride: @ride_2, mechanic: @mechanic_2)
  RideMechanic.create(ride: @ride_1, mechanic: @mechanic_3)
  RideMechanic.create(ride: @ride_2, mechanic: @mechanic_3)
  
end