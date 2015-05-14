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

ActiveRecord::Schema.define(version: 20150507163810) do

  create_table "photos", force: :cascade do |t|
    t.string   "title",      null: false
    t.string   "url",        null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "photos", ["title"], name: "index_photos_on_title"
  add_index "photos", ["url"], name: "index_photos_on_url"

  create_table "posts", force: :cascade do |t|
    t.string   "title",      null: false
    t.string   "body",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "posts", ["body"], name: "index_posts_on_body"
  add_index "posts", ["title"], name: "index_posts_on_title"

  create_table "posts_tags", force: :cascade do |t|
    t.integer "tag_id"
    t.integer "post_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string   "content",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tags", ["content"], name: "index_tags_on_content"

end
