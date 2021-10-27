# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_10_27_063535) do

  create_table "meals", force: :cascade do |t|
    t.datetime "date"
    t.integer "rating"
    t.text "comment"
    t.integer "patron_id"
    t.integer "restaurant_id"
  end

  create_table "menu_items", force: :cascade do |t|
    t.string "category"
    t.string "name"
    t.integer "price"
    t.integer "restaurant_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "meal_id"
    t.integer "menu_item_id"
  end

  create_table "patrons", force: :cascade do |t|
    t.string "name"
    t.string "image"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.string "address"
  end

end
