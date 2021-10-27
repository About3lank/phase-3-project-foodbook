class CreateMenuItem < ActiveRecord::Migration[6.1]
  def change
    create_table :menu_items do |t|
      t.string :category
      t.string :name
      # t.text :description
      # t.string :image
      t.integer :price
      t.integer :restaurant_id
    end
  end
end
