# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

unless User.find(1).present?
  User.create!(name: "Admin", email: "hs918100@gmail.com", password: "harish")
end

unless Product.first.present? 
  Product.create([
  { name: 'Wireless Mouse', description: 'A smooth wireless mouse with ergonomic design.', category: 'Electronics', stock: 120, price: 29.99 },
  { name: 'Bluetooth Headphones', description: 'Over-ear headphones with noise cancellation.', category: 'Electronics', stock: 75, price: 89.99 },
  { name: 'Smartphone Charger', description: 'Fast charging cable for smartphones.', category: 'Accessories', stock: 150, price: 12.99 },
  { name: 'Laptop Sleeve', description: 'Durable laptop sleeve with extra padding.', category: 'Accessories', stock: 50, price: 19.99 },
  { name: '4K Monitor', description: 'A high-resolution 4K monitor for gaming and work.', category: 'Electronics', stock: 30, price: 399.99 },
  { name: 'Gaming Keyboard', description: 'Mechanical keyboard with RGB backlighting.', category: 'Electronics', stock: 45, price: 79.99 },
  { name: 'LED Desk Lamp', description: 'Adjustable desk lamp with touch control.', category: 'Furniture', stock: 100, price: 39.99 },
  { name: 'Wireless Charger', description: 'Qi-enabled wireless charging pad for phones.', category: 'Accessories', stock: 80, price: 24.99 },
  { name: 'Smartwatch', description: 'Fitness tracking smartwatch with heart rate monitor.', category: 'Electronics', stock: 200, price: 149.99 },
  { name: 'Ergonomic Office Chair', description: 'Comfortable office chair with lumbar support.', category: 'Furniture', stock: 60, price: 199.99 },
  { name: 'Air Fryer', description: 'Healthy cooking air fryer with easy-to-clean basket.', category: 'Appliances', stock: 110, price: 129.99 },
  { name: 'Cordless Vacuum', description: 'Lightweight cordless vacuum cleaner for home use.', category: 'Appliances', stock: 40, price: 159.99 },
  { name: 'Electric Kettle', description: 'Quick boiling electric kettle with auto shut-off.', category: 'Appliances', stock: 85, price: 29.99 },
  { name: 'Blender', description: 'High-speed blender for smoothies and shakes.', category: 'Appliances', stock: 95, price: 79.99 },
  { name: 'Coffee Maker', description: 'Automatic drip coffee maker with programmable timer.', category: 'Appliances', stock: 100, price: 69.99 },
  { name: 'Smart Thermostat', description: 'Smart home thermostat with Wi-Fi connectivity.', category: 'Electronics', stock: 70, price: 199.99 },
  { name: 'Digital Camera', description: 'Compact digital camera with HD video recording.', category: 'Electronics', stock: 50, price: 249.99 },
  { name: 'Portable Speaker', description: 'Bluetooth speaker with great sound quality.', category: 'Electronics', stock: 90, price: 39.99 },
  { name: 'USB Flash Drive', description: 'Portable storage for data transfer.', category: 'Accessories', stock: 200, price: 9.99 },
  { name: 'Noise Cancelling Earbuds', description: 'In-ear wireless earbuds with noise cancellation.', category: 'Electronics', stock: 150, price: 99.99 },
  { name: 'Laptop Stand', description: 'Adjustable laptop stand for ergonomic typing.', category: 'Furniture', stock: 65, price: 29.99 },
  { name: 'Power Bank', description: 'Portable power bank for charging devices on the go.', category: 'Accessories', stock: 110, price: 29.99 },
  { name: 'Electric Griddle', description: 'Large surface griddle for cooking breakfast items.', category: 'Appliances', stock: 55, price: 49.99 },
  { name: 'Smart Light Bulb', description: 'Wi-Fi enabled light bulb for smart home control.', category: 'Electronics', stock: 130, price: 19.99 },
  { name: 'Smart Door Lock', description: 'Keyless entry door lock with Bluetooth.', category: 'Electronics', stock: 40, price: 149.99 },
  { name: 'Wall Art', description: 'Modern abstract wall art for home decor.', category: 'Furniture', stock: 80, price: 59.99 },
  { name: 'Couch', description: 'Comfortable sofa with memory foam cushions.', category: 'Furniture', stock: 30, price: 499.99 },
  { name: 'Table Lamp', description: 'Stylish lamp with adjustable brightness.', category: 'Furniture', stock: 120, price: 39.99 },
  { name: 'Yoga Mat', description: 'Non-slip mat for yoga and exercise routines.', category: 'Fitness', stock: 200, price: 19.99 },
  { name: 'Fitness Tracker', description: 'Track your steps, calories, and heart rate.', category: 'Fitness', stock: 150, price: 59.99 },
  { name: 'Dumbbell Set', description: 'Adjustable dumbbell set for home workouts.', category: 'Fitness', stock: 45, price: 129.99 },
  { name: 'Treadmill', description: 'Foldable treadmill with multiple workout programs.', category: 'Fitness', stock: 35, price: 799.99 },
  { name: 'Exercise Ball', description: 'Inflatable stability ball for core workouts.', category: 'Fitness', stock: 100, price: 14.99 },
  { name: 'Resistance Bands', description: 'Set of durable resistance bands for strength training.', category: 'Fitness', stock: 150, price: 24.99 },
  { name: 'Gym Bag', description: 'Spacious gym bag with multiple compartments.', category: 'Fitness', stock: 70, price: 39.99 },
  { name: 'Running Shoes', description: 'Comfortable running shoes with breathable fabric.', category: 'Footwear', stock: 60, price: 89.99 },
  { name: 'Hiking Boots', description: 'Durable boots for outdoor hiking and trekking.', category: 'Footwear', stock: 50, price: 129.99 },
  { name: 'Casual Sneakers', description: 'Stylish sneakers for everyday wear.', category: 'Footwear', stock: 90, price: 59.99 },
  { name: 'High Heels', description: 'Elegant high heels for formal occasions.', category: 'Footwear', stock: 40, price: 79.99 },
  { name: 'Leather Jacket', description: 'Premium leather jacket with a stylish fit.', category: 'Clothing', stock: 35, price: 199.99 },
  { name: 'Denim Jeans', description: 'Classic blue jeans with a comfortable fit.', category: 'Clothing', stock: 100, price: 49.99 },
  { name: 'T-Shirt', description: 'Basic cotton t-shirt available in various colors.', category: 'Clothing', stock: 150, price: 19.99 },
  { name: 'Hoodie', description: 'Cozy hoodie with a front pocket and adjustable drawstrings.', category: 'Clothing', stock: 80, price: 39.99 },
  { name: 'Sweater', description: 'Warm knitted sweater for colder seasons.', category: 'Clothing', stock: 120, price: 49.99 },
  { name: 'Jacket', description: 'Windproof jacket with a soft inner lining.', category: 'Clothing', stock: 60, price: 89.99 },
  { name: 'Sunglasses', description: 'UV-protective sunglasses with a stylish frame.', category: 'Accessories', stock: 80, price: 29.99 },
  { name: 'Watch', description: 'Stylish wristwatch with leather band.', category: 'Accessories', stock: 90, price: 79.99 },
  { name: 'Wallet', description: 'Genuine leather wallet with multiple card slots.', category: 'Accessories', stock: 100, price: 39.99 },
  { name: 'Backpack', description: 'Spacious and durable backpack for everyday use.', category: 'Accessories', stock: 120, price: 59.99 },
  { name: 'Laptop Bag', description: 'Stylish bag to carry your laptop and accessories.', category: 'Accessories', stock: 150, price: 39.99 },
  { name: 'Suitcase', description: 'Durable suitcase with 360-degree wheels.', category: 'Accessories', stock: 45, price: 199.99 },
  { name: 'Table', description: 'Modern dining table with a minimalist design.', category: 'Furniture', stock: 20, price: 299.99 },
  { name: 'Chair', description: 'Comfortable chair with padded seat and back.', category: 'Furniture', stock: 150, price: 89.99 },
  { name: 'Bookshelf', description: 'Wooden bookshelf with adjustable shelves.', category: 'Furniture', stock: 70, price: 149.99 },
  { name: 'Sofa Bed', description: 'Convertible sofa bed for small apartments.', category: 'Furniture', stock: 40, price: 399.99 },
  { name: 'Coffee Table', description: 'Stylish coffee table with a modern design.', category: 'Furniture', stock: 90, price: 149.99 },
  { name: 'Desk', description: 'Office desk with multiple drawers for storage.', category: 'Furniture', stock: 80, price: 199.99 },
  { name: 'Dining Chair', description: 'Elegant dining chair made from wood with cushion.', category: 'Furniture', stock: 120, price: 59.99 },
  { name: 'Ottoman', description: 'Soft and comfortable ottoman for living rooms.', category: 'Furniture', stock: 110, price: 79.99 },
  { name: 'Fridge', description: 'Energy-efficient fridge with a large capacity.', category: 'Appliances', stock: 30, price: 499.99 },
  { name: 'Microwave Oven', description: 'Compact microwave oven for quick meals.', category: 'Appliances', stock: 85, price: 99.99 },
  { name: 'Dishwasher', description: 'High-efficiency dishwasher with multiple wash cycles.', category: 'Appliances', stock: 40, price: 349.99 },
  { name: 'Washing Machine', description: 'Front-load washing machine with large drum capacity.', category: 'Appliances', stock: 60, price: 699.99 },
  { name: 'Oven', description: 'Convection oven for baking and grilling.', category: 'Appliances', stock: 50, price: 249.99 },
  { name: 'Air Conditioner', description: 'Portable air conditioner with remote control.', category: 'Appliances', stock: 45, price: 299.99 },
  { name: 'Fan', description: 'High-speed oscillating fan for cooling.', category: 'Appliances', stock: 100, price: 29.99 }
])
end
