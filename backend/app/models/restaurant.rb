class Restaurant < ActiveRecord::Base
    has_many :menu_items
    has_many :meals
    has_many :orders, through: :menu_items
    has_many :patrons, through: :meals
    # has_many :patrons, through: :meals
end