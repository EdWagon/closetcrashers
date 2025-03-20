# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Color.destroy_all
red = Color.create(name: "red", hex: "#7C0A02")
blue = Color.create(name: "blue", hex: "##1E90FF")

Apparel.destroy_all
Apparel.create(name:"Red Dress", description:"This is a beautiful blue dress", price: 2300, address: "23 Darlinghurst road, Potts Point", color: red)
Apparel.create(name:"Blue Dress", description:"This is a beautiful blue dress", price: 1300, address: "57 Darlinghurst Road, Potts Point", color: blue)
Apparel.create(name:"Blue Pants", description:"This is a beautiful blue dress", price: 1300, address: "36 Victoria St, Potts Point, Sydney", color: blue)
