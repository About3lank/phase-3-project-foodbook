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
        r1m1_wings = MenuItem.create(name: "Chicken Wings", category: "Appetizers", price: 7, restaurant_id: r1_pizza.id)
        r1m2_pineapple = MenuItem.create(name: "Pineapple Pizza", category: "Entrees", price: 5, restaurant_id: r1_pizza.id)
        r1m3_pepperoni = MenuItem.create(name: "Pepperoni Pizza", category: "Entrees", price: 5, restaurant_id: r1_pizza.id)
        r1m4_spaghetti = MenuItem.create(name: "Spaghetti and Meatballs", category: "Entrees", price: 12, restaurant_id: r1_pizza.id)
        r1m5_gbread = MenuItem.create(name: "Garlic Bread", category: "Sides", price: 6, restaurant_id: r1_pizza.id)
        r1m6_ices = MenuItem.create(name: "Italian Ices", category: "Desserts", price: 4, restaurant_id: r1_pizza.id)

    # Menu Items for Restaurant2 - Tacos Tacos Tacos
        r2m1_nachos = MenuItem.create(name: "Explosive Hot Nachos", category: "Appetizers", price: 9, restaurant_id: r2_tacos.id)
        r2m2_burrito = MenuItem.create(name: "Burrito Caliente", category: "Entrees", price: 12, restaurant_id: r2_tacos.id)
        r2m3_guac = MenuItem.create(name: "Guacamole", category: "Sides", price: 3, restaurant_id: r2_tacos.id)
        r2m4_icecream = MenuItem.create(name: "Spicy Ice Cream", category: "Desserts", price: 6, restaurant_id: r2_tacos.id)

    # Menu Items for Restaurant3 - Jim's BBQ
        r3m1_sliders = MenuItem.create(name: "Sliders", category: "Appetizers", price: 7, restaurant_id: r3_bbq.id)
        r3m2_pork = MenuItem.create(name: "Pulled Pork Sandwich", category: "Entrees", price: 12, restaurant_id: r3_bbq.id)
        r3m3_chicken = MenuItem.create(name: "Chicken Sandwich", category: "Entrees", price: 11, restaurant_id: r3_bbq.id)
        r3m4_fries = MenuItem.create(name: "French Fries", category: "Sides", price: 5, restaurant_id: r3_bbq.id)
        r3m5_cobbler = MenuItem.create(name: "Peach Cobbler", category: "Desserts", price: 8, restaurant_id: r3_bbq.id)

    # Menu Items for Restaurant4 - Fancyson Steakhouse
        r4m1_salad = MenuItem.create(name: "Cobb Salad", category: "Appetizers", price: 27, restaurant_id: r4_steak.id)
        r4m2_beef = MenuItem.create(name: "Beef Wellington", category: "Entrees", price: 58, restaurant_id: r4_steak.id)
        r4m3_spinach = MenuItem.create(name: "Creamed Spinach", category: "Sides", price: 19, restaurant_id: r4_steak.id)
        r4m4_donut = MenuItem.create(name: "Jellyfish Jelly Donut", category: "Desserts", price: 24, restaurant_id: r4_steak.id)

puts "Seeding patrons..."
        p1_junkrat = Patron.create(name: "Jamison Fawkes", image: "https://pbs.twimg.com/profile_images/787695298835542016/nfLYRC-U_400x400.jpg")
        p2_mercy = Patron.create(name: "Dr. Angela Ziegler", image: "https://m.media-amazon.com/images/I/61AnSXf7TSL._AC_SX425_.jpg")
        p3_mccree = Patron.create(name: "Jesse McCree", image: "https://www.dexerto.com/wp-content/uploads/2021/10/22/mccree-overwatch-cole-cassidy.jpg")
        p4_tracer = Patron.create(name: "Amélie Lacroix", image: "https://cdn.vox-cdn.com/thumbor/35fC0eUYMANzACY0vtRK67YM-ow=/0x0:1920x798/1200x800/filters:focal(983x70:1289x376)/cdn.vox-cdn.com/uploads/chorus_image/image/60025255/d4e273e1efaf62f4b28eecdd1bd68793.0.png")
        # p5_lucio = Patron.create(name: "Lúcio Correia dos Santos", image: "https://fenixbazaar.com/wp-content/uploads/2019/08/lucio.jpg.webp")


puts "Seeding meals..."
    # Hash stores dummy reviews as for seeding, indexing of review_bank matches 
    review_bank = [
            ["", "", "", "", "", ""],
            ["Terrible!", "Gross!!", "Undercooked :(", "This was soo bad", ""],
            ["Not good :(", "Meh...", "I've had better!!", "Very bad order!", ""],
            ["Average", "So so", "It was OK", "Not bad, but not good either", ""],
            ["Pretty good!", "I liked it :)", "Good but could be better...","Very good :D", ""],
            ["Amazing!!", "Wow so good :D :D", "Yummmm", "Delicious!", ""]
        ]

        # Need random but reusable values to pair ratings to comments in review_bank
        rand_num_bank = []
        1000.times { rand_num_bank << rand(6) }

        # binding.pry

        Patron.all.each do |p|
            r_id = rand(Restaurant.all.count) + 1
            (rand(10)+1).times do
                Meal.create(patron_id: p.id, restaurant_id: r_id, date: rand(2.years).seconds.ago, rating: rand_num_bank[0], comment: review_bank[rand_num_bank.shift][ rand(6) ])
            end
        end

        Meal.all.each do |m|
            # binding.pry
            # puts "MENU: ", menu

            menu = MenuItem.where("restaurant_id = #{m.restaurant_id}")
            puts menu.length

            (rand(4)+1).times do
                item_id = rand(menu.length) + 1
                Order.create(meal_id: m.id, menu_item_id: item_id)
            end
        end
        
        


#     # Meals for Patron1 - Junkrat
#         p1m1 = Meal.create(patron_id: p1_junkrat.id, date: rand(2.years).seconds.ago, rating: rand_num_bank[0], comment: review_bank[rand_num_bank.shift][ rand(6) ])
#         p1m2 = Meal.create(patron_id: p1_junkrat.id, date: rand(2.years).seconds.ago, rating: rand_num_bank[0] , comment: review_bank[rand_num_bank.shift - 1][ rand(6) ])

#     # Meals for Patron2 - Mercy
#         p2m1 = Meal.create(patron_id: p2_mercy.id, date: rand(2.years).seconds.ago, rating: rand_num_bank[0], comment: review_bank[rand_num_bank.shift][ rand(6) ])

#     # Meals for Patron3 - McCree
#         p3m1 = Meal.create(patron_id: p3_mccree.id, date: rand(2.years).seconds.ago, rating: rand_num_bank[0], comment: review_bank[rand_num_bank.shift][ rand(6) ])
#         p3m2 = Meal.create(patron_id: p3_mccree.id, date: rand(2.years).seconds.ago, rating: rand_num_bank[0], comment: review_bank[rand_num_bank.shift][ rand(6) ])
#         p3m3 = Meal.create(patron_id: p3_mccree.id, date: rand(2.years).seconds.ago, rating: rand_num_bank[0], comment: review_bank[rand_num_bank.shift][ rand(6) ])
#     # Meals for Patron4 - Tracer
#         p4m1 = Meal.create(patron_id: p4_tracer.id, date: rand(2.years).seconds.ago, rating: rand_num_bank[0], comment: review_bank[rand_num_bank.shift][ rand(6) ])
#         p4m2 = Meal.create(patron_id: p4_tracer.id, date: rand(2.years).seconds.ago, rating: rand_num_bank[0], comment: review_bank[rand_num_bank.shift][ rand(6) ])
#         p4m3 = Meal.create(patron_id: p4_tracer.id, date: rand(2.years).seconds.ago, rating: rand_num_bank[0], comment: review_bank[rand_num_bank.shift][ rand(6) ])

# puts "Seeding orders"
#     # Orders for Patron1 (Junkrat)'s Meals
#         p1m1o1 = Order.create(meal_id: p1m1.id, menu_item_id: r2m1_nachos.id)
#         p1m1o2 = Order.create(meal_id: p1m1.id, menu_item_id: r2m4_icecream.id)
#         #
#         p1m2o1 = Order.create(meal_id: p1m2.id, menu_item_id: r1m2_pineapple.id)
#     # Orders for Patron2 (Mercy)'s Meals    
#         p2m1o1 = Order.create(meal_id: p2m1.id, menu_item_id: r1m1_wings.id)
#         p2m1o2 = Order.create(meal_id: p2m1.id, menu_item_id: r1m4_spaghetti.id)
#         p2m1o3 = Order.create(meal_id: p2m1.id, menu_item_id: r1m5_gbread.id)
#         p2m1o4 = Order.create(meal_id: p2m1.id, menu_item_id: r1m6_ices.id)
#     # Orders for Patron3 (McCree)'s Meals   
#         p3m1o1 = Order.create(meal_id: p3m1.id, menu_item_id: r3m3_chicken.id)
#         p3m1o2 = Order.create(meal_id: p3m1.id, menu_item_id: r3m5_cobbler.id)
#         #
#         p3m2o1 = Order.create(meal_id: p3m2.id, menu_item_id: r4m1_salad.id)
#         p3m2o2 = Order.create(meal_id: p3m2.id, menu_item_id: r4m2_beef.id)
#         p3m2o3 = Order.create(meal_id: p3m2.id, menu_item_id: r4m3_spinach.id)
#         #
#         p3m3o1 = Order.create(meal_id: p3m2.id, menu_item_id: r2m2_burrito.id)
#     # Orders for Patron4 (Tracer)'s Meals   
#         p4m1o1 = Order.create(meal_id: p4m1.id, menu_item_id: r4m2_beef.id)
#         p4m1o1 = Order.create(meal_id: p4m1.id, menu_item_id: r4m4_donut.id)
#         #
#         p4m2o1 = Order.create(meal_id: p4m2.id, menu_item_id: r2m2_burrito.id)
#         p4m2o1 = Order.create(meal_id: p4m2.id, menu_item_id: r2m3_guac.id)
#         p4m2o1 = Order.create(meal_id: p4m2.id, menu_item_id: r2m4_icecream.id)
#         #
#         p4m3o1 = Order.create(meal_id: p4m3.id, menu_item_id: r1m1_wings.id)
#         p4m3o2 = Order.create(meal_id: p4m3.id, menu_item_id: r1m4_spaghetti.id)
#         p4m3o3 = Order.create(meal_id: p4m3.id, menu_item_id: r1m5_gbread.id)
#         p4m3o4 = Order.create(meal_id: p4m3.id, menu_item_id: r1m6_ices.id)
        
        



puts "✅ Done seeding!"
