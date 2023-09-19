# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
AmusementPark.destroy_all
RideMechanic.destroy_all
Ride.destroy_all
Mechanic.destroy_all

@six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
@universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

@hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
@scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
@ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

@jaws = @universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)

@mechanic_1 = Mechanic.create!(name: "Kiwi Mechanic", years_experience: 2)
@mechanic_2 = Mechanic.create!(name: "Coco Mechanic", years_experience: 1)
@mechanic_3 = Mechanic.create!(name: "Chicken Mechanic", years_experience: 5)

@park_1 = AmusementPark.create!(name: "Chicken's Park", admission_cost: 50)

@ride_1 = Ride.create!(name: "Hiccup's Coaster", thrill_rating: 1, open: true, amusement_park_id: @park_1.id)
@ride_2 = Ride.create!(name: "Hiccup's Teacups", thrill_rating: 10, open: false, amusement_park_id: @park_1.id)
@ride_3 = Ride.create!(name: "Hiccup's Racing", thrill_rating: 2, open: true, amusement_park_id: @park_1.id)

RideMechanic.create!(ride_id: @ride_1.id, mechanic_id: @mechanic_1.id)
RideMechanic.create!(ride_id: @ride_2.id, mechanic_id: @mechanic_1.id)
RideMechanic.create!(ride_id: @ride_1.id, mechanic_id: @mechanic_2.id)
RideMechanic.create!(ride_id: @ride_3.id, mechanic_id: @mechanic_3.id)