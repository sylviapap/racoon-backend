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

ActiveRecord::Schema.define(version: 2020_04_29_170527) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookmarks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "map_marker_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["map_marker_id"], name: "index_bookmarks_on_map_marker_id"
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "content"
    t.bigint "user_id", null: false
    t.bigint "map_marker_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["map_marker_id"], name: "index_comments_on_map_marker_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "map_markers", force: :cascade do |t|
    t.float "latitude"
    t.float "longitude"
    t.string "title"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.string "message"
    t.string "type"
    t.index ["user_id"], name: "index_map_markers_on_user_id"
  end

  create_table "reported_symptoms", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "symptom_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["symptom_id"], name: "index_reported_symptoms_on_symptom_id"
    t.index ["user_id"], name: "index_reported_symptoms_on_user_id"
  end

  create_table "symptoms", force: :cascade do |t|
    t.string "category"
    t.string "common_name"
    t.string "infermedica_id"
    t.string "name"
    t.string "question"
    t.string "seriousness"
    t.string "sex_filter"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "bookmarks", "map_markers"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "comments", "map_markers"
  add_foreign_key "comments", "users"
  add_foreign_key "map_markers", "users"
  add_foreign_key "reported_symptoms", "symptoms"
  add_foreign_key "reported_symptoms", "users"
end
