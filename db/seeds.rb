CATEGORIES = ["appetizer", "main course", "side", "dessert"]

Item.delete_all
12.times do
  Item.create!(name: Faker::Food.dish, description: Faker::Food.description, category: CATEGORIES.sample, price: Faker::Commerce.price)
end

User.delete_all
User.create!(email: "zach.broaddus@gmail.com", first_name: "Zach", password: "admin1", role: "admin")
5.times do
  User.create!(email: Faker::Internet.safe_email, first_name: Faker::Name.first_name, password: Faker::Internet.password(8, 12), role: "user")
end

Order.delete_all
Order.create!(user_id: 1)
Order.create!(user_id: 2)

OrderItem.delete_all
8.times do
  OrderItem.create!(order_id: rand(1..2), item_id: rand(1..12))
end
