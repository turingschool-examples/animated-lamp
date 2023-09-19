# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
AmusementPark.destroy_all
Ride.destroy_all

six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

hurler = six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
scrambler = six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
ferris = six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

jaws = universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)

mechanic_1 = Mechanic.create!(
  name: "Frank Fixes",
  years_experience: 12
)

mechanic_2 = Mechanic.create!(
  name: "Abby Awesome",
  years_experience: 2
)

mechanic_3 = Mechanic.create!(
  name: "Eliza Engineer",
  years_experience: 25
)

mechanic_4 = Mechanic.create!(
  name: "Bob Builder",
  years_experience: 40
)

RideMechanic.create!(mechanic: mechanic_1, ride: hurler)
RideMechanic.create!(mechanic: mechanic_1, ride: scrambler)
RideMechanic.create!(mechanic: mechanic_2, ride: scrambler)
RideMechanic.create!(mechanic: mechanic_2, ride: ferris)
RideMechanic.create!(mechanic: mechanic_3, ride: jaws)
RideMechanic.create!(mechanic: mechanic_4, ride: jaws)
