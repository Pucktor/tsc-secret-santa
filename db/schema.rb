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

ActiveRecord::Schema.define(version: 2021_01_31_142946) do

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "amount"
  end

  create_table "matches", force: :cascade do |t|
    t.integer "event_id"
    t.integer "giver_id"
    t.integer "receiver_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_matches_on_event_id"
    t.index ["giver_id"], name: "index_matches_on_giver_id"
    t.index ["receiver_id"], name: "index_matches_on_receiver_id"
  end

  create_table "participants", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "event_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_participants_on_event_id"
  end

  add_foreign_key "matches", "events"
  add_foreign_key "matches", "participants", column: "giver_id"
  add_foreign_key "matches", "participants", column: "receiver_id"
  add_foreign_key "participants", "events"
end
