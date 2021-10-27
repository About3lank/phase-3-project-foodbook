class Meal < ActiveRecord::Base
    belongs_to :patron
    has_many :orders
    has_many :menu_items, through: :orders
    has_many :restaurants, through: :menu_items
end