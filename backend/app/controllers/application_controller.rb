class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  get "/db/patrons" do
    Patron.all.to_json(include: {
      meals: {
        include: 
        :orders
        }
      }
    )
  end

  get "/db/restaurants" do
    Restaurant.all.to_json(include: [:menu_items])
  end


  get "/db/menu_items" do
    MenuItem.all.to_json 
  end

  get "/db/meals" do
    Meal.all.to_json(include: :orders)
  end

  get "/db/orders" do
    Order.all.to_json(include: [:restaurant, :patron, :meal])
  end

end
