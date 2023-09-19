# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Ride.destroy_all
AmusementPark.destroy_all
Mechanic.destroy_all

@six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
@universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

@hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
@scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
@ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

@jaws = @universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)

@mechanic_1 = Mechanic.create!(name: 'Buster', years_experience: 11)
@mechanic_2 = Mechanic.create!(name: 'Joe', years_experience: 5)
@mechanic_3 = Mechanic.create!(name: 'Stevie', years_experience: 10)

MechanicsRide.create!(mechanic_id: @mechanic_1.id, ride_id: @hurler.id)
MechanicsRide.create!(mechanic_id: @mechanic_1.id, ride_id: @scrambler.id)

MechanicsRide.create!(mechanic_id: @mechanic_2.id, ride_id: @jaws.id)

MechanicsRide.create!(mechanic_id: @mechanic_3.id, ride_id: @ferris.id)
