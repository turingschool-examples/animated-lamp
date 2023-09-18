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
@log_flume = @universal.rides.create!(name: 'Log Flume', thrill_rating: 8, open: true)
@twister = @universal.rides.create!(name: 'Twister', thrill_rating: 9, open: false)

@Steve = Mechanic.create!(name: 'Steve', year_experience: 5)
@Amanda = Mechanic.create!(name: 'Amanda', year_experience: 10)
@Will = Mechanic.create!(name: 'Will', year_experience: 3)

@ride_mechanic1 = RideMechanic.create!(ride: @hurler, mechanic: @Steve)
@ride_mechanic2 = RideMechanic.create!(ride: @hurler, mechanic: @Amanda)
@ride_mechanic3 = RideMechanic.create!(ride: @scrambler, mechanic: @Amanda)
@ride_mechanic4 = RideMechanic.create!(ride: @ferris, mechanic: @Will)