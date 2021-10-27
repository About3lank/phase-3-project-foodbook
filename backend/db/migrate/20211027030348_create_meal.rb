class CreateMeal < ActiveRecord::Migration[6.1]
  def change
    create_table :meals do |t|
      # t.string :image
      t.datetime :date
      t.integer :rating
      t.text :comment
      t.integer :patron_id
    end
  end
end
