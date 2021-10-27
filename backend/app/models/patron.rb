class Patron < ActiveRecord::Base
    has_many :meals
    # has_many :restaurant_reviews
    has_many :restaurants, through: :meals
    # has_many :menu_items, through: :meals
end