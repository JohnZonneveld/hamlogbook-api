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

ActiveRecord::Schema.define(version: 2020100291850) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contacts", force: :cascade do |t|
    t.integer "user_id"
    t.string "owncall"
    t.string "station_callsign"
    t.string "my_gridsquare"
    t.string "call"
    t.string "band"
    t.string "freq"
    t.string "freq_rcvd", default: "-"
    t.string "mode"
    t.string "submode", default: "-"
    t.string "modegroup", default: "-"
    t.date "qso_date"
    t.time "time_on"
    t.boolean "qsl_rcvd", default: false
    t.date "qsl_rdate"
    t.string "dxcc", default: "-"
    t.string "country"
    t.string "iota", default: "-"
    t.string "gridsquare"
    t.string "state", default: "-"
    t.string "cnty", default: "-"
    t.string "cqz", default: "-"
    t.string "ituz", default: "-"
    t.string "park", default: "-"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "callsign"
    t.string "password_digest"
    t.string "email"
    t.string "my_qth"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
