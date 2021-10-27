class Restaurant < ActiveRecord::Base
    has_many :menu_items
    has_many :orders, through: :menu_items
    has_many :meals, through: :orders
    # has_many :patrons, through: :meals
end