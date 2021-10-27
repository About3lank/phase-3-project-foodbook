class CreateMeal < ActiveRecord::Migration[6.1]
  def change
    create_table :meals do |t|
      t.integer :patron_id
      # t.string :image
      t.datetime :date
    end
  end
end
