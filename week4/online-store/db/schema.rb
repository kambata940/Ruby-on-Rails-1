# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150423175040) do

  create_table "brands", force: :cascade do |t|
    t.text "name"
    t.text "description"
  end

  create_table "categories", force: :cascade do |t|
    t.text "name"
  end

  create_table "products", force: :cascade do |t|
    t.integer "brand_id"
    t.integer "category_id"
    t.text    "name",        null: false
    t.decimal "price",       null: false
    t.integer "quantity",    null: false
  end

  add_index "products", ["brand_id"], name: "index_products_on_brand_id"
  add_index "products", ["category_id"], name: "index_products_on_category_id"

end
