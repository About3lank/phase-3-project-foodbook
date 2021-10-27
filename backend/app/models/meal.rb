class Meal < ActiveRecord::Base
    belongs_to :patron
    belongs_to :restaurant
    has_many :orders
    has_many :menu_items, through: :orders
end