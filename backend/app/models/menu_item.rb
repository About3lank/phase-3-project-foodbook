class MenuItem < ActiveRecord::Base
    belongs_to :restaurant
    has_many :orders
    has_many :meals, through: :orders
    has_many :patrons, through: :meals
end