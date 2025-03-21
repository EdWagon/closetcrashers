# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   en

# require 'URI'
require 'open-uri'

puts ("Inserting users")
User.destroy_all
theo = User.new(email: "theo@gemjungle.com", password: "theodrak", first_name: "Teddy", last_name: "Drak", address: "56 Darlinghusrst Road, Potts Point, NSW, Australia")
theo.save
peggy = User.new(email: "lupeggy0608@gmail.com", password: "peggyLuLu", first_name: "Peggy", last_name: "Lu", address: "Auckland Central, Auckland, 1021, New Zealand")
peggy.save
ed = User.new(email: "ed.dillee@outlook.com", password: "eduoardlu", first_name: "Ed", last_name: "Ed", address: "41 Stewart St, Melbourne VIC 3121")
ed.save

puts ("Inserting colors")
Color.destroy_all
Brown = Color.create(name: "Brown", hex: "#895129")
Oatmeal = Color.create(name: "Burgundy", hex: "#D1B399")
Burgundy = Color.create(name: "Black", hex: "#660033")
Black = Color.create(name: "Black", hex: "#000000")
Yellow = Color.create(name: "Yellow", hex: "#E4D96F")
Beige = Color.create(name: "Beige", hex: "#EDE8D0")
Green = Color.create(name: "Green", hex: "#636B2F")
Grey = Color.create(name: "Grey", hex: "#6D8196")

Apparel.destroy_all
# Apparel.create(name:"Red Dress", description:"This is a beautiful blue dress", price: 2300, address: "23 Darlinghurst road, potts point", color: red)
# Apparel.create(name:"Blue Dress", description:"This is a beautiful blue dress", price: 1300, address: "57 Darlinghurst Road, potts point", color: blue)

headers = {"User-Agent" => "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36"}

puts ("Inserting Apparel")
cl1= Apparel.new(name: 'Tortoiseshell Sunglasses', color: Color.find_by(name: 'Brown'),user: User.find_by(first_name:'Peggy'),address: '56 Darlinghusrst Road, Potts Point, NSW, Australia',price: 100)
cl2= Apparel.new(name: 'Half Zip Knitted Pullover', color: Color.find_by(name: 'Oatmeal'),user: User.find_by(first_name:'Ed'),address: '41 Stewart St, Melbourne VIC 3121',price: 1450)
cl3= Apparel.new(name: 'Kenny Bomber', color: Color.find_by(name: 'Brown'),user: User.find_by(first_name:'Teddy'),address: '56 Darlinghusrst Road, Potts Point, NSW, Australia',price: 2563)
cl4= Apparel.new(name: 'Kenny Bomber Woven', color: Color.find_by(name: 'Burgundy'),user: User.find_by(first_name:'Peggy'),address: 'Auckland Central, Auckland, 1021, New Zealand',price: 567)
cl5= Apparel.new(name: 'Phoenix Midi Dress', color: Color.find_by(name: 'Black'),user: User.find_by(first_name:'Peggy'),address: 'Auckland Central, Auckland, 1021, New Zealand',price: 599)
cl6= Apparel.new(name: 'Emilia Sequin Flower Maxi Dress', color: Color.find_by(name: 'Yellow'),user: User.find_by(first_name:'Peggy'),address: 'Auckland Central, Auckland, 1021, New Zealand',price: 2000)
cl7= Apparel.new(name: 'Romy High Heel Sandal', color: Color.find_by(name: 'Beige'),user: User.find_by(first_name:'Peggy'),address: 'Auckland Central, Auckland, 1021, New Zealand',price: 1999)
cl8= Apparel.new(name: 'Palmer Bomber Jacket', color: Color.find_by(name: 'Green'),user: User.find_by(first_name:'Ed'),address: '41 Stewart St, Melbourne VIC 3121',price: 1870)
cl9= Apparel.new(name: 'Detroit Jacket', color: Color.find_by(name: 'Grey'),user: User.find_by(first_name:'Teddy'),address: '56 Darlinghusrst Road, Potts Point, NSW, Australia',price: 4000)
cl1.photos.attach(io: URI.parse('https://img1.theiconic.com.au/Q9cW8Aq9cyryXXU8PNTtIbokNjw=/634x811/filters:quality(95):fill(ffffff)/http%3A%2F%2Fstatic.theiconic.com.au%2Fp%2Faire-2516-6279971-1.jpg').open(headers), filename: 'image.jpg')
cl1.photos.attach(io: URI.parse('https://img1.theiconic.com.au/8AT6ytkTKi5XYDxN87-QXkXTWkg=/fit-in/406x512/filters:fill(ffffff):quality(90):format(webp)/http%3A%2F%2Fstatic.theiconic.com.au%2Fp%2Faire-2516-6279971-4.jpg').open(headers), filename: 'image.jpg')
cl1.photos.attach(io: URI.parse('https://img1.theiconic.com.au/Rl6kr_u6AlsmbgSHUbnaHdymeWQ=/fit-in/406x512/filters:fill(ffffff):quality(90):format(webp)/http%3A%2F%2Fstatic.theiconic.com.au%2Fp%2Faire-2516-6279971-2.jpg').open(headers), filename: 'image.jpg')
cl2.photos.attach(io: URI.parse('https://img1.theiconic.com.au/mYfY9SYZ79nSZBM3zGfVJOwW-s4=/634x811/filters:quality(95):fill(ffffff)/http%3A%2F%2Fstatic.theiconic.com.au%2Fp%2Fjack-jones-9750-5871971-1.jpg').open(headers), filename: 'image.jpg')
cl2.photos.attach(io: URI.parse('https://img1.theiconic.com.au/iIm0XJGIdtcX9GvdahrEIGWizCY=/634x811/filters:quality(95):fill(ffffff)/http%3A%2F%2Fstatic.theiconic.com.au%2Fp%2Fjack-jones-9577-5871971-2.jpg').open(headers), filename: 'image.jpg')
cl2.photos.attach(io: URI.parse('https://img1.theiconic.com.au/TmHA26DntkWrEcMAHXj612jz7Ko=/634x811/filters:quality(95):fill(ffffff)/http%3A%2F%2Fstatic.theiconic.com.au%2Fp%2Fjack-jones-9765-5871971-6.jpg').open(headers), filename: 'image.jpg')
cl3.photos.attach(io: URI.parse('https://img1.theiconic.com.au/NZz2Gkmy-UIxYoAoXxe8ldHeHpE=/634x811/filters:quality(95):fill(ffffff)/http%3A%2F%2Fstatic.theiconic.com.au%2Fp%2Flioness-7922-5375481-1.jpg').open(headers), filename: 'image.jpg')
cl3.photos.attach(io: URI.parse('https://img1.theiconic.com.au/mqDgA_rswbjiRNc4y10lllAKyiA=/634x811/filters:quality(95):fill(ffffff)/http%3A%2F%2Fstatic.theiconic.com.au%2Fp%2Flioness-7928-5375481-3.jpg').open(headers), filename: 'image.jpg')
cl4.photos.attach(io: URI.parse('https://img1.theiconic.com.au/iz_qugKYtdNG7QCE-6G1GsIeD8A=/634x811/filters:quality(95):fill(ffffff)/http%3A%2F%2Fstatic.theiconic.com.au%2Fp%2Flioness-8938-6751132-1.jpg').open(headers), filename: 'image.jpg')
cl4.photos.attach(io: URI.parse('https://img1.theiconic.com.au/uCErdGaxcpgW5MKMXW2RWH0-_vM=/634x811/filters:quality(95):fill(ffffff)/http%3A%2F%2Fstatic.theiconic.com.au%2Fp%2Flioness-8938-6751132-5.jpg').open(headers), filename: 'image.jpg')
cl5.photos.attach(io: URI.parse('https://img1.theiconic.com.au/UepStHwjVOpIgFSU6XF11mpaDo4=/634x811/filters:quality(95):fill(ffffff)/http%3A%2F%2Fstatic.theiconic.com.au%2Fp%2Ftussah-1990-5918932-1.jpg').open(headers), filename: 'image.jpg')
cl5.photos.attach(io: URI.parse('https://img1.theiconic.com.au/SxqxwZ0u0dOgKBLlu-87Zteuz90=/634x811/filters:quality(95):fill(ffffff)/http%3A%2F%2Fstatic.theiconic.com.au%2Fp%2Ftussah-2001-5918932-3.jpg').open(headers), filename: 'image.jpg')
cl6.photos.attach(io: URI.parse('https://img1.theiconic.com.au/F7RnH66csl--Zx07Yr-_9D242j4=/634x811/filters:quality(95):fill(ffffff)/http%3A%2F%2Fstatic.theiconic.com.au%2Fp%2Flover-the-label-8436-1462332-3.jpg').open(headers), filename: 'image.jpg')
cl6.photos.attach(io: URI.parse('https://img1.theiconic.com.au/LIAjZPBaMv3WtZTaQmy12Bg4g5o=/634x811/filters:quality(95):fill(ffffff)/http%3A%2F%2Fstatic.theiconic.com.au%2Fp%2Flover-the-label-8436-1462332-4.jpg').open(headers), filename: 'image.jpg')
cl7.photos.attach(io: URI.parse('https://img1.theiconic.com.au/WgnwWUs6sWB56-5nfqzznGQHeso=/634x811/filters:quality(95):fill(ffffff)/http%3A%2F%2Fstatic.theiconic.com.au%2Fp%2Fjo-mercer-4497-2965342-1.jpg').open(headers), filename: 'image.jpg')
cl7.photos.attach(io: URI.parse('https://img1.theiconic.com.au/lrdC3RrwPcEFXtwjQA5fKDcePnw=/634x811/filters:quality(95):fill(ffffff)/http%3A%2F%2Fstatic.theiconic.com.au%2Fp%2Fjo-mercer-4501-2965342-3.jpg').open(headers), filename: 'image.jpg')
cl7.photos.attach(io: URI.parse('https://img1.theiconic.com.au/LJ1FaAKKx8of2oiaxdxRmT1jkY0=/634x811/filters:quality(95):fill(ffffff)/http%3A%2F%2Fstatic.theiconic.com.au%2Fp%2Fjo-mercer-4509-2965342-7.jpg').open(headers), filename: 'image.jpg')
cl8.photos.attach(io: URI.parse('https://img1.theiconic.com.au/bv7DWdIiAjC3nIcbTS6xEYuQ3lY=/634x811/filters:quality(95):fill(ffffff)/http%3A%2F%2Fstatic.theiconic.com.au%2Fp%2Fr-m-williams-3294-0594842-1.jpg').open(headers), filename: 'image.jpg')
cl8.photos.attach(io: URI.parse('https://img1.theiconic.com.au/JaxLXG5W9r4NdvPBcJZ1pxKilFc=/634x811/filters:quality(95):fill(ffffff)/http%3A%2F%2Fstatic.theiconic.com.au%2Fp%2Fr-m-williams-3363-0594842-2.jpg').open(headers), filename: 'image.jpg')
cl8.photos.attach(io: URI.parse('https://img1.theiconic.com.au/Lt5G1WhejI2wSA7MF72onh37HlY=/634x811/filters:quality(95):fill(ffffff)/http%3A%2F%2Fstatic.theiconic.com.au%2Fp%2Fr-m-williams-3415-0594842-4.jpg').open(headers), filename: 'image.jpg')
cl8.photos.attach(io: URI.parse('https://img1.theiconic.com.au/qbwGR6YDdlZyMA9rSos7JdnAYlY=/634x811/filters:quality(95):fill(ffffff)/http%3A%2F%2Fstatic.theiconic.com.au%2Fp%2Fr-m-williams-3406-0594842-3.jpg').open(headers), filename: 'image.jpg')
cl9.photos.attach(io: URI.parse('https://img1.theiconic.com.au/-UuegPeYa9jfoJnvFkPT8He7RUs=/634x811/filters:quality(95):fill(ffffff)/http%3A%2F%2Fstatic.theiconic.com.au%2Fp%2Fcarhartt-wip-8784-2761532-1.jpg').open(headers), filename: 'image.jpg')
cl1.save
cl2.save
cl3.save
cl4.save
cl5.save
cl6.save
cl7.save
cl8.save
cl9.save
puts ("Inserted Apparel")
