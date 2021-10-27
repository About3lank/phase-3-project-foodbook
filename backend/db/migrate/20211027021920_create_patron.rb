class CreatePatron < ActiveRecord::Migration[6.1]
  def change
    create_table :patrons do |t|
      t.string :name
      t.string :image
      # t.text :bio
    end
  end
end
