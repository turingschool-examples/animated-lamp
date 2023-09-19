# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
AmusementPark.destroy_all
Ride.destroy_all

@six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
@universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

@hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
@scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
@ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

@jaws = @universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)

@bob = Mechanic.create!(name: 'Bob', years_experience: 10)
@sue = Mechanic.create!(name: 'Sue', years_experience: 15)
@alex = Mechanic.create!(name: 'Alex', years_experience: 20)

@ride_mechanic1 = RideMechanic.create!(mechanic_id: @alex.id, ride_id: @hurler.id)
@ride_mechanic1 = RideMechanic.create!(mechanic_id: @alex.id, ride_id: @ferris.id)