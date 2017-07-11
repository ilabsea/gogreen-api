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

ActiveRecord::Schema.define(version: 20170711041412) do

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.text   "description"
    t.string "facebook_link"
    t.text   "location"
    t.date   "date"
    t.time   "start_time"
    t.time   "end_time"
    t.string "image"
  end

  create_table "pin_photos", force: :cascade do |t|
    t.text     "photo"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "pin_id"
    t.boolean  "is_approved", default: false
    t.index ["pin_id"], name: "index_pin_photos_on_pin_id"
  end

  create_table "pins", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.float    "latitude",   limit: 24
    t.float    "longitude",  limit: 24
    t.string   "icon"
    t.string   "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "marker_id"
    t.integer  "total_photos"
  end

  add_foreign_key "pin_photos", "pins"
end
