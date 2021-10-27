class Order < ActiveRecord::Base
    belongs_to :meal
    belongs_to :menu_item

    # belongs_to :patron, through: :meal
    has_one :restaurant, through: :menu_item
    has_one :patron, through: :meal
end