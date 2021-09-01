# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# utile pour recréer des Users mais attention à désactiver l'envoi d'emails de confirmation d'abord
# [User, Item].map {|tab| tab.destroy_all}
# ['users', 'items'].map {|tab| ActiveRecord::Base.connection.reset_pk_sequence!(tab)}

# Seed sans recréation des Users (pour éviter l'envoi d'emails automatiques via devise)
[Item].map {|tab| tab.destroy_all}
['items'].map {|tab| ActiveRecord::Base.connection.reset_pk_sequence!(tab)}

10.times do
  puts "coucou"
  item = Item.new(title:Faker::Games::Pokemon.name, description:Faker::Restaurant.review, price:rand(10000..100000).to_f/100)
  puts item
  number = rand(1..4)
  puts "coucou"
  puts number
  item.image_url.attach(io: File.open("app/assets/images/chat#{number}.jpg"), filename: "chat#{number}.jpg")
  puts "coucou"
  puts item.image_url
  item.save
end
# , image_url:"https://source.unsplash.com/1600x900/?cat"


