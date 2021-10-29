class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here

  get "/" do
    Patron.all.to_json(include: {
      meals: {
        except: [:patron_id, :restaurant_id],
        include: {
          restaurant: {except: [:meal_id, :menu_item_id]},
          menu_items: {except: :restaurant_id}
        }   
      }
    })
  end

  get "/patrons" do
    Patron.all.to_json
  end

  get "/patrons/:id" do
    Patron.find(params[:id]).to_json(include: {
      meals: {
        except: [:patron_id, :restaurant_id],
        include: {
          restaurant: {except: [:meal_id, :menu_item_id]},
          menu_items: {except: :restaurant_id}
        }   
      }

    })
  end

  get "/restaurants" do
    Restaurant.all.to_json(include: {
      menu_items: {
        except: :restaurant_id
      }
    })
  end

  get "/menu_items" do
    MenuItem.all.to_json(except: :restaurant_id, include: {
      restaurant: {
      }
    })
  end

  get "/meals" do
    Meal.all.to_json(include: {
      orders: {
        include: :menu_item
      }
    })
  end

  post "/meals" do
    meal = Meal.create(
      date: DateTime.now(),
      rating: params[:rating],
      comment: params[:comment],
      patron_id: params[:patron_id],
      restaurant_id: params[:restaurant_id]
    )
  end

  delete "/meals/:id" do
    meal = Meal.find(params[:id])
    meal.destroy
    meal.to_json
  end

  get "/orders" do
    Order.all.to_json
  end

end
