# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Route.destroy_all
Stop.destroy_all
Passenger.destroy_all
Tier.destroy_all
Reservation.destroy_all


Route.create(name: "Niko - Northern Corridor", directions: "East/West", total_distance: 2850)
Route.create(name: "Olivia - Southern Corridor", directions: "East/West", total_distance: 3000)
Route.create(name: "Max - Eastern Corridor", directions: "North/South", total_distance: 1500)



route_niko_cities = ["New York", "Philadelphia", "Pittsburgh", "Cleveland", "Chicago", "Milwaukee", "Minneapolis", "Salt Lake City", "Portland", "Seattle"]

route_olivia_cities = ["Washington DC", "Charlotte", "Atlanta", "New Orleans", "Houston", "Austin", "Albuquerque", "Phoenix", "Los Angeles", "San Francisco"]

route_max_cities = ["Miami", "Tampa", "Orlando", "Jacksonville", "Charleston", "Raleigh", "Richmond", "Baltimore", "Trenton", "Boston"]


route_niko_cities.each do |city|
    Stop.create(city_name: city, route_id: Route.find_by(name: "Niko - Northern Corridor").id)
end

route_olivia_cities.each do |city|
    Stop.create(city_name: city, route_id: Route.find_by(name: "Olivia - Southern Corridor").id)
end

route_max_cities.each do |city|
    Stop.create(city_name: city, route_id: Route.find_by(name: "Max - Eastern Corridor").id)
end


Passenger.create(first_name: "Olivia", last_name: "Madden", email: "madden@gmail.com", password: "Olivia")

Passenger.create(first_name: "Niko", last_name: "Dixon", email: "dixon@gmail.com", password: "Niko")

Passenger.create(first_name: "Max", last_name: "McFadden", email: "mcfadden@gmail.com", password: "Max")

30.times do
    Passenger.create(first_name: Faker::Name.unique.first_name, last_name: Faker::Name.unique.last_name, email: Faker::Internet.unique.email, password: Faker::Beer.unique.brand)
end


Tier.create(name: "Monocle", amenities: "Private Car with Bed & Bath, Fancy Meals by Chef Montclaire, Unlimited Bar-service", price: 1000)

Tier.create(name: "Suit", amenities: "Sleeper Car wih Shared Bath, Choice between 3 Meal-options, 2 Drink-tickets per Stop included", price: 500)

Tier.create(name: "Sweatpants", amenities: "Comfy Seat in Standard Car, Access to Dining Car, Access to Bar", price: 0)


dates = ["02/14/2020", "05/06/2020", "02/20/2020", "03/05/2020", "01/08/2021", "04/09/2020", "08/13/2020", "10/12/2020" ]

10.times do
    Reservation.create(passenger_id: Passenger.all.ids.sample, route_id: Route.first.id, tier_id: Tier.all.ids.sample, destination_city: route_niko_cities.sample, departure_city: route_niko_cities.sample, departure_date: dates.sample )
end

10.times do
    Reservation.create(passenger_id: Passenger.all.ids.sample, route_id: Route.second.id, tier_id: Tier.all.ids.sample, destination_city: route_olivia_cities.sample, departure_city: route_olivia_cities.sample, departure_date: dates.sample )
end

10.times do
    Reservation.create(passenger_id: Passenger.all.ids.sample, route_id: Route.last.id, tier_id: Tier.all.ids.sample, destination_city: route_max_cities.sample, departure_city: route_max_cities.sample, departure_date: dates.sample )
end


