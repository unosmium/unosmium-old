# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_05_04_144955) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.boolean "trial"
    t.boolean "trialed"
    t.integer "scoring"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_events_on_name", unique: true
  end

  create_table "penalties", force: :cascade do |t|
    t.bigint "team_id", null: false
    t.integer "points"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["team_id"], name: "index_penalties_on_team_id"
  end

  create_table "placings", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.bigint "team_id", null: false
    t.boolean "participated"
    t.boolean "disqualified"
    t.integer "place"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_placings_on_event_id"
    t.index ["team_id"], name: "index_placings_on_team_id"
  end

  create_table "scores", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.bigint "team_id", null: false
    t.boolean "participated"
    t.boolean "disqualified"
    t.decimal "score"
    t.integer "tiebreaker_place"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_scores_on_event_id"
    t.index ["team_id"], name: "index_scores_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "school"
    t.string "suffix"
    t.integer "subdivision"
    t.integer "number"
    t.string "city"
    t.integer "state"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["number"], name: "index_teams_on_number", unique: true
  end

  create_table "tournaments", force: :cascade do |t|
    t.string "name"
    t.integer "level"
    t.integer "division"
    t.integer "year"
    t.date "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "penalties", "teams"
  add_foreign_key "placings", "events"
  add_foreign_key "placings", "teams"
  add_foreign_key "scores", "events"
  add_foreign_key "scores", "teams"
end
