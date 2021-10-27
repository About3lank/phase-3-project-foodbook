class CreateMenuItem < ActiveRecord::Migration[6.1]
  def change
    create_table :menu_items do |t|
      t.integer :restaurant_id
      t.string :category
      t.string :name
      # t.text :description
      # t.string :image
      t.integer :price
    end
  end
end
