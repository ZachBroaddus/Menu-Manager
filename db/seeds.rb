# CATEGORIES = ["appetizer", "entree", "beverage", "dessert"]

Item.delete_all
# 12.times do
#   Item.create!(name: Faker::Food.unique.dish, description: Faker::Food.unique.description, category: CATEGORIES.sample, price: Faker::Commerce.price)
# end

# Entrees
Item.create!(name: "The Chopper", description: "House butchered'n'brined pork chop, cheesy Anson Mill grits, charred broccoli raab & roasted leeks, hazelnut salsa verde, pork jus", category: "entree", price: 28, image_url: "pork-chop.jpg")
Item.create!(name: "Southern Bird", description: "Buttermilk-fried chicken, Hoppin John with smoked andouille, cider-braised collard greens, chicken juice, chili oil", category: "entree", price: 26, image_url: "fried-chicken.jpg")
Item.create!(name: "It's What's for Dinner", description: "Grilled hanger steak, farro verde with roasted butternut squash & baby carrots, stinging nettles, porcini butter", category: "entree", price: 28, image_url: "hanger-steak.jpg")
Item.create!(name: "Basketkase", description: "Traditional Austrian kasekrainer, mustard seed & caraway, Emmentaler cheese, grain mustard, onion marmalade", category: "entree", price: 16, image_url: "basketkase.jpg")
Item.create!(name: "Prudhomme's Magic", description: "Smoked andouille, garlic & paprika, thyme & cayenne, magyc mustard, master stock braised collard greens", category: "entree", price: 16, image_url: "andouille.jpg")
Item.create!(name: "Tlaloc", description: "Mexican chorizo, coriander, allspice, chilies & citrus, smashed avocado, pickled pepper & onion slaw", category: "entree", price: 16, image_url: "chorizo.jpg")

# Appetizers
Item.create!(name: "Popeye", description: "Warm spinach, house-smoked bacon, fuji apple, toasted walnuts, poached egg, cider-mustard vinaigrette", category: "appetizer", price: 13, image_url: "popeye.jpg")
Item.create!(name: "The Kraken", description: "Grilled Monterey Bay squid, crisped Yukon potatoes, mizuna, mint & lime, harissa", category: "appetizer", price: 15, image_url: "kraken.jpg")
Item.create!(name: "Abattoir Meatballs", description: "Ground pork shoulder with rapini, pine nut & grana, three-hour tomato gravy, garlic-rubbed grilled levain", category: "appetizer", price: 16, image_url: "abattoir-meatballs.jpg")
Item.create!(name: "Flower Power", description: "Fried cauliflower & wild arugula, anchovy­currant vinaigrette, whipped ricotta", category: "appetizer", price: 11, image_url: "flower-power.jpg")
Item.create!(name: "'Role Play", description: "Escarole braised in white wine with country ham, Calabrian chili & garlic, ewe's milk cheese, herbed bread crumbs", category: "appetizer", price: 12, image_url: "role-play.jpg")

#Beverages
Item.create!(name: "Roast Co. Coffee", description: "A Bottomless Cup", category: "beverage", price: 3.5, image_url: "coffee.jpg")
Item.create!(name: "Hand-Squeezed OJ", description: "California's finest, 8 ounces", category: "beverage", price: 5, image_url: "orange-juice.jpg")
Item.create!(name: "Organic Cold-Brewed Iced Tea", description: "A Bottomless Glass", category: "beverage", price: 4, image_url: "iced-tea.jpg")

#Desserts
Item.create!(name: "Crème Brûlée", description: "custard with a crust of caramelized sugar", category: "dessert", price: 8, image_url: "creme-brulee.jpg")
Item.create!(name: "Bread Pudding", description: "crème anglaise, raspberry sauce", category: "dessert", price: 8, image_url: "bread-pudding.jpg")
Item.create!(name: "Pecan Tarte", description: "vanilla ice cream, chocolate sauce", category: "dessert", price: 10, image_url: "pecan-tarte.jpg")
Item.create!(name: "Flourless Chocolate Cake", description: "raspberry sauce, whip’d cream", category: "dessert", price: 10, image_url: "flourless-chocolate-cake.jpg")
Item.create!(name: "Affogato", description: "double-shot espresso, caramel ice cream", category: "dessert", price: 7, image_url: "affogato.jpg")

User.delete_all
User.create!(email: "zach.broaddus@gmail.com", first_name: "Zach", password: "admin123", role: "admin")
# 5.times do
#   User.create!(email: Faker::Internet.safe_email, first_name: Faker::Name.first_name, password: Faker::Internet.password(8, 12), role: "user")
# end

# Order.delete_all
# Order.create!(user_id: 1, status: "placed")
# Order.create!(user_id: 2, status: "placed")

# OrderItem.delete_all
# 8.times do
#   OrderItem.create!(order_id: rand(1..2), item_id: rand(1..12), quantity: 1)
# end
