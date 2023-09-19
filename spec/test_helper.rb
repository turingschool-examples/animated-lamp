def load_test_data
  @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
  @universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

  @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
  @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
  @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

  @jaws = @universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)

  @kara = Mechanic.create!(name: 'Kara Smith', years_experience: 11)
  @teddy = Mechanic.create!(name: 'Theodore Smith', years_experience: 21)
  @bart = Mechanic.create!(name: 'Bartholomew Smith', years_experience: 31)

  @kara_hurler = @kara.mechanic_rides.create!(mechanic_id: @kara.id, ride_id: @hurler.id)
  @kara_scrambler = @kara.mechanic_rides.create!(mechanic_id: @kara.id, ride_id: @scrambler.id)
end