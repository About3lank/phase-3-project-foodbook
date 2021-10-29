puts "🌱 Starting up seeds.rb ..."

    puts "Destroying all data..."
        Patron.destroy_all
        Restaurant.destroy_all
        Meal.destroy_all
        MenuItem.destroy_all
        Order.destroy_all


####################################################


puts "Seeding restaurants..."
        r1_pizza = Restaurant.create(name: "Pizza Planet", address: "123 Goodfood Ln. Foodington, CA 42236")
        r2_tacos = Restaurant.create(name: "¡Tacos Tacos Tacos!", address: "880 Chowdown Blvd. Foodington, CA 42236")
        r3_bbq = Restaurant.create(name: "Jim's BBQ", address: "87 Grillin Way Foodington, CA 42236")
        r4_steak = Restaurant.create(name: "Fancyson Steakhouse", address: "4211 Krabcake Tpk. Foodington, CA 42236")

puts "Seeding menu_items..."
    # Menu Items for Restaurant1 - Pizza Planet
        MenuItem.create(name: "Chicken Wings", category: "Appetizers", price: 7, restaurant_id: r1_pizza.id)
        MenuItem.create(name: "Pineapple Pizza", category: "Entrees", price: 5, restaurant_id: r1_pizza.id)
        MenuItem.create(name: "Pepperoni Pizza", category: "Entrees", price: 5, restaurant_id: r1_pizza.id)
        MenuItem.create(name: "Spaghetti and Meatballs", category: "Entrees", price: 12, restaurant_id: r1_pizza.id)
        MenuItem.create(name: "Garlic Bread", category: "Sides", price: 6, restaurant_id: r1_pizza.id)
        MenuItem.create(name: "Italian Ices", category: "Desserts", price: 4, restaurant_id: r1_pizza.id)

    # Menu Items for Restaurant2 - Tacos Tacos Tacos
        MenuItem.create(name: "Explosive Hot Nachos", category: "Appetizers", price: 9, restaurant_id: r2_tacos.id)
        MenuItem.create(name: "Burrito Caliente", category: "Entrees", price: 12, restaurant_id: r2_tacos.id)
        MenuItem.create(name: "Guacamole", category: "Sides", price: 3, restaurant_id: r2_tacos.id)
        MenuItem.create(name: "Spicy Ice Cream", category: "Desserts", price: 6, restaurant_id: r2_tacos.id)

    # Menu Items for Restaurant3 - Jim's BBQ
        MenuItem.create(name: "Sliders", category: "Appetizers", price: 7, restaurant_id: r3_bbq.id)
        MenuItem.create(name: "Pulled Pork Sandwich", category: "Entrees", price: 12, restaurant_id: r3_bbq.id)
        MenuItem.create(name: "Chicken Sandwich", category: "Entrees", price: 11, restaurant_id: r3_bbq.id)
        MenuItem.create(name: "French Fries", category: "Sides", price: 5, restaurant_id: r3_bbq.id)
        MenuItem.create(name: "Peach Cobbler", category: "Desserts", price: 8, restaurant_id: r3_bbq.id)

    # Menu Items for Restaurant4 - Fancyson Steakhouse
        MenuItem.create(name: "Cobb Salad", category: "Appetizers", price: 27, restaurant_id: r4_steak.id)
        MenuItem.create(name: "Beef Wellington", category: "Entrees", price: 58, restaurant_id: r4_steak.id)
        MenuItem.create(name: "Creamed Spinach", category: "Sides", price: 19, restaurant_id: r4_steak.id)
        MenuItem.create(name: "Jellyfish Jelly Donut", category: "Desserts", price: 24, restaurant_id: r4_steak.id)

puts "Seeding patrons..."
        Patron.create(name: "Jamison Fawkes", image: "https://pbs.twimg.com/profile_images/787695298835542016/nfLYRC-U_400x400.jpg")
        Patron.create(name: "Dr. Angela Ziegler", image: "https://m.media-amazon.com/images/I/61AnSXf7TSL._AC_SX425_.jpg")
        Patron.create(name: "Jesse McCree", image: "https://www.dexerto.com/wp-content/uploads/2021/10/22/mccree-overwatch-cole-cassidy.jpg")
        Patron.create(name: "Amélie Lacroix", image: "https://cdn.vox-cdn.com/thumbor/35fC0eUYMANzACY0vtRK67YM-ow=/0x0:1920x798/1200x800/filters:focal(983x70:1289x376)/cdn.vox-cdn.com/uploads/chorus_image/image/60025255/d4e273e1efaf62f4b28eecdd1bd68793.0.png")
        # p5_lucio = Patron.create(name: "Lúcio Correia dos Santos", image: "https://fenixbazaar.com/wp-content/uploads/2019/08/lucio.jpg.webp")


puts "Seeding meals..."
    # Hash stores dummy reviews for seeding, indexing of review_bank matches ratings
    review_bank = [
            ["", "", "", "", ""],
            ["Terrible!", "Gross!!", "Undercooked :(", "This was soo bad", ""],
            ["Not good :(", "Meh...", "I've had better!!", "Very bad order!", ""],
            ["Average", "So so", "It was OK", "Not bad, but not good either", ""],
            ["Pretty good!", "I liked it :)", "Good but could be better...","Very good :D", ""],
            ["Amazing!!", "Wow so good :D :D", "Yummmm", "Delicious!", ""]
        ]

        # Need random but reusable values to pair ratings to comments in review_bank
        rand_num_bank = []
        1000.times { rand_num_bank << rand(6) }

        # Create random number of meals (between 1 and 10) for each patron
        Patron.all.each do |p|
            r_id = rand(Restaurant.all.count) + 1
            (rand(10)+1).times do
                Meal.create(patron_id: p.id, restaurant_id: r_id, date: rand(2.years).seconds.ago, rating: rand_num_bank[0], comment: review_bank[rand_num_bank.shift][ rand(5) ])
            end
        end

        # Create random number of mebu_items (between 1 and 4) for each meal
        Meal.all.each do |m|
            menu = MenuItem.where("restaurant_id = #{m.restaurant_id}")
            (rand(4)+1).times do
                item_id = rand(menu.length) + 1
                Order.create(meal_id: m.id, menu_item_id: item_id)
            end
        end
        
puts "✅ Done seeding!"
