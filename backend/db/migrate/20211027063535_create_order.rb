class CreateOrder < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :meal_id
      t.integer :menu_item_id
    end
  end
end
