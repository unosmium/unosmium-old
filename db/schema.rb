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

ActiveRecord::Schema.define(version: 2019_05_18_234359) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "event_supervisors_events", id: false, force: :cascade do |t|
    t.bigint "event_supervisor_id", null: false
    t.bigint "event_id", null: false
    t.index ["event_id", "event_supervisor_id"], name: "index_events_on_supervisors", unique: true
  end

  create_table "events", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "trial", default: false, null: false
    t.boolean "trialed", default: false, null: false
    t.integer "scoring", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "tournament_id", null: false
    t.index ["name"], name: "index_events_on_name"
    t.index ["tournament_id"], name: "index_events_on_tournament_id"
  end

  create_table "penalties", force: :cascade do |t|
    t.bigint "team_id", null: false
    t.integer "points", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["team_id"], name: "index_penalties_on_team_id"
  end

  create_table "presentations", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "presentations_tournaments", id: false, force: :cascade do |t|
    t.bigint "tournament_id", null: false
    t.bigint "presentation_id", null: false
    t.index ["presentation_id"], name: "index_presentations_tournaments_on_presentation_id"
    t.index ["tournament_id"], name: "index_presentations_tournaments_on_tournament_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.bigint "tournament_id", null: false
    t.index ["tournament_id"], name: "index_roles_on_tournament_id"
    t.index ["user_id"], name: "index_roles_on_user_id"
  end

  create_table "scores", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.bigint "team_id", null: false
    t.boolean "participated", default: true, null: false
    t.boolean "disqualified", default: false, null: false
    t.decimal "score"
    t.integer "tiebreaker_place"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "tier"
    t.index ["event_id"], name: "index_scores_on_event_id"
    t.index ["team_id"], name: "index_scores_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "school", null: false
    t.string "suffix"
    t.integer "subdivision"
    t.integer "number", null: false
    t.string "city", null: false
    t.integer "state", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "tournament_id", null: false
    t.boolean "exhibition"
    t.index ["number"], name: "index_teams_on_number"
    t.index ["tournament_id"], name: "index_teams_on_tournament_id"
  end

  create_table "tournaments", force: :cascade do |t|
    t.integer "level", default: 0, null: false
    t.integer "division", null: false
    t.integer "year", null: false
    t.date "date", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "location", null: false
    t.integer "state"
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "events", "tournaments"
  add_foreign_key "penalties", "teams"
  add_foreign_key "roles", "tournaments"
  add_foreign_key "roles", "users"
  add_foreign_key "scores", "events"
  add_foreign_key "scores", "teams"
  add_foreign_key "teams", "tournaments"
end
