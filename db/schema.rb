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

ActiveRecord::Schema.define(version: 2018_08_15_021252) do

  create_table "incident_proofs", force: :cascade do |t|
    t.integer "incident_id"
    t.string "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "incidents", force: :cascade do |t|
    t.integer "school_id"
    t.text "description"
    t.text "incident_type"
    t.string "reportee_name"
    t.string "reportee_email"
    t.string "reportee_phone"
    t.string "reportee_role"
    t.text "defaulter_details"
    t.text "witness_details"
    t.datetime "incident_time"
    t.text "location"
    t.boolean "is_anonymous"
    t.boolean "is_quick"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_incidents_on_school_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
