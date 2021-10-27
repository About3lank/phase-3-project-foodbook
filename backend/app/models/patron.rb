class Patron < ActiveRecord::Base
    has_many :meals
    has_many :orders, through: :meals
    has_many :menu_items, through: :orders
    # has_many :restaurants, through: :menu_items
end