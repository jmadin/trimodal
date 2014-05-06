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

ActiveRecord::Schema.define(version: 20140421202709) do

  create_table "areas", force: true do |t|
    t.integer  "observation_id"
    t.string   "outliner_name"
    t.string   "outline_filename"
    t.decimal  "area"
    t.boolean  "flag"
    t.text     "notes"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photographer_name"
    t.boolean  "acceptable"
    t.boolean  "acceptable_outline"
    t.decimal  "perimeter"
  end

  add_index "areas", ["observation_id"], name: "index_areas_on_observation_id"

  create_table "contributors", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "short_name"
    t.string   "email"
    t.string   "phone"
    t.string   "institution"
    t.string   "country"
    t.text     "contributor_profile"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "corals", force: true do |t|
    t.integer  "transect"
    t.integer  "map_x"
    t.integer  "map_y"
    t.integer  "dim_1"
    t.integer  "dim_2"
    t.string   "species"
    t.string   "species_code"
    t.text     "notes"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "fecund_corals", force: true do |t|
    t.integer  "fieldtrip_id"
    t.string   "species"
    t.string   "species_code"
    t.integer  "dim_1"
    t.integer  "dim_2"
    t.string   "habitat"
    t.string   "outliner_name"
    t.string   "outline_filename"
    t.decimal  "area"
    t.boolean  "flag"
    t.text     "notes"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "fecund_corals", ["fieldtrip_id"], name: "index_fecund_corals_on_fieldtrip_id"

  create_table "fieldtrips", force: true do |t|
    t.string   "name"
    t.string   "name_code"
    t.date     "date"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "observations", force: true do |t|
    t.integer  "coral_id"
    t.integer  "fieldtrip_id"
    t.integer  "mother_id"
    t.integer  "tag_number"
    t.string   "action"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.text     "notes"
    t.integer  "active_tag"
  end

  add_index "observations", ["coral_id"], name: "index_observations_on_coral_id"
  add_index "observations", ["fieldtrip_id"], name: "index_observations_on_fieldtrip_id"

  create_table "people", force: true do |t|
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.text     "address"
    t.string   "email"
    t.string   "phone"
    t.string   "role"
    t.text     "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spawners", force: true do |t|
    t.integer  "fieldtrip_id"
    t.string   "species"
    t.string   "species_code"
    t.integer  "tag_number"
    t.decimal  "area"
    t.text     "notes"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "outliner_name"
    t.integer  "person_id"
  end

  add_index "spawners", ["fieldtrip_id"], name: "index_spawners_on_fieldtrip_id"
  add_index "spawners", ["person_id"], name: "index_spawners_on_person_id"

  create_table "ss_corals", force: true do |t|
    t.integer  "fieldtrip_id"
    t.string   "species"
    t.string   "species_code"
    t.integer  "dim_1"
    t.integer  "dim_2"
    t.string   "habitat"
    t.string   "outliner_name"
    t.string   "outline_filename"
    t.decimal  "area"
    t.text     "notes"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "ss_corals", ["fieldtrip_id"], name: "index_ss_corals_on_fieldtrip_id"

  create_table "touches", force: true do |t|
    t.integer  "area_id"
    t.string   "outliner_name"
    t.string   "outline_filename"
    t.string   "taxon1"
    t.string   "taxon2"
    t.string   "touch_type"
    t.decimal  "length"
    t.boolean  "flag"
    t.text     "notes"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "touch_number"
    t.string   "growth_form"
  end

  add_index "touches", ["area_id"], name: "index_touches_on_area_id"

end
