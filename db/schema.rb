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

ActiveRecord::Schema.define(version: 2022_03_01_035220) do

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.time "time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "location_id"
    t.integer "host_id"
    t.index ["host_id"], name: "index_events_on_host_id"
    t.index ["location_id"], name: "index_events_on_location_id"
  end

  create_table "events_guests", force: :cascade do |t|
    t.integer "attended_event_id"
    t.integer "guest_id"
    t.index ["attended_event_id"], name: "index_events_guests_on_attended_event_id"
    t.index ["guest_id"], name: "index_events_guests_on_guest_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "events", "locations"
  add_foreign_key "events", "users", column: "host_id"
  add_foreign_key "events_guests", "events", column: "attended_event_id"
  add_foreign_key "events_guests", "users", column: "guest_id"
end
