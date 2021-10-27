class Restaurant < ActiveRecord::Base
    has_many :menu_items
    has_many :meals, through: :menu_items

    has_many :orders, through: :menu_items
    has_many :patrons, through: :orders

        # has_many :restaurant_reviews

end