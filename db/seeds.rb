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
[OrderItem, CartItem, Item, Cart, Order, Category].map {|tab| tab.destroy_all}
['order_items', 'cart_items', 'items', 'carts', 'orders', 'categories'].map {|tab| ActiveRecord::Base.connection.reset_pk_sequence!(tab)}

category_list = ['Gros chats', 'chats noirs', 'chats Wiskas', 'Chats-Thons']

category_list.length.times do |i|
  category = Category.new(name: category_list[i], description: "#{category_list[i]}, c'est pas assez clair ?")
  category.save
end

10.times do
  item = Item.new(title:Faker::Games::Pokemon.name, description:Faker::Restaurant.review, price:rand(10000..100000).to_f/100, category_id:rand(1..category_list.length))
  number = rand(1..4)
  item.image_url.attach(io: File.open("app/assets/images/chat#{number}.jpg"), filename: "chat#{number}.jpg")
  item.save
end
# , image_url:"https://source.unsplash.com/1600x900/?cat"