class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    # { message: "Good luck with your project!" }.to_json
    "Homepage".to_json
  end


  get "/db" do
    Patron.all.to_json(include: {
      meals: {
        except: [:patron_id, :restaurant_id],
        include: :restaurant,
        include: {
          orders: {
            except: [:meal_id, :menu_item_id],
            include: :menu_item
          }
        }
      }
    })
  end

  # get "/db" do
  #   Patron.all.to_json(include: {
  #     meals: {
  #       except: [:patron_id, :restaurant_id]
  #       include: {
  #         [orders:, :] {
  #           except: [:menu_id, :restaurant_id],
  #           include: {
  #             menu_item: {
  #               except: :restaurant_id,
  #               include: :restaurant
  #             }
  #           }
  #         }
  #       }
  #     }
  #   })
  # end


  get "/db/patrons" do
    Patron.all.to_json
  end

  # get "/db/patrons/:id" do
  #   Patron.all.to_json
  # end

  get "/db/restaurants" do
    Restaurant.all.to_json(include: {
      menu_items: {
        except: :restaurant_id
      }
    })
  end

  get "/db/menu_items" do
    MenuItem.all.to_json(except: :restaurant_id, include: {
      restaurant: {
      }
    })
  end

  get "/db/meals" do
    Meal.all.to_json(include: {
      orders: {
        include: :menu_item
      }
    })
  end

  get "/db/orders" do
    Order.all.to_json
  end

end
