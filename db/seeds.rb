# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
AmusementPark.destroy_all
Ride.destroy_all

# @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
# @universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

# @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
# @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
# @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

# @jaws = @universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)

@theme_park = AmusementPark.create!(name: "Itchy and Scratchy Land", admission_cost: 12)

@ride_1 = @theme_park.rides.create!(name: "Puke Monster", thrill_rating: 3, open: false)
@ride_2 = @theme_park.rides.create!(name: "Carousel", thrill_rating: 9, open: false)
@ride_3 = @theme_park.rides.create!(name: "The Nauseator", thrill_rating: 6, open: false)
@ride_4 = @theme_park.rides.create!(name: "Eggsplosion", thrill_rating: 25, open: false)


@mechanic_1 = Mechanic.create!(name: "MC Ride", years_experience: 3)
@mechanic_2 = Mechanic.create!(name: "Scruffy", years_experience: 4)
@mechanic_3 = Mechanic.create!(name: "Fonzie", years_experience: 5)
@mechanic_4 = Mechanic.create!(name: "Rosie", years_experience: 6)

@workorder_1 = MechanicRide.create!(mechanic: @mechanic_1, ride: @ride_1)
@workorder_2 = MechanicRide.create!(mechanic: @mechanic_1, ride: @ride_2)
@workorder_3 = MechanicRide.create!(mechanic: @mechanic_3, ride: @ride_3)
@workorder_4 = MechanicRide.create!(mechanic: @mechanic_4, ride: @ride_3) 