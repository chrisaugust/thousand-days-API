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

ActiveRecord::Schema[7.1].define(version: 2025_03_17_200001) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "commitments", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "timeframe"
    t.bigint "user_id", null: false
    t.bigint "image_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["image_id"], name: "index_commitments_on_image_id"
    t.index ["user_id"], name: "index_commitments_on_user_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "name", null: false
    t.string "url", null: false
    t.integer "num_regions", null: false
    t.jsonb "metadata", default: {}, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "regionColorMapping"
    t.index ["url"], name: "index_images_on_url", unique: true
  end

  create_table "progress_entries", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "image_id", null: false
    t.integer "day", null: false
    t.integer "region_id", null: false
    t.string "color", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["image_id"], name: "index_progress_entries_on_image_id"
    t.index ["user_id", "day", "region_id"], name: "index_progress_entries_on_user_id_and_day_and_region_id", unique: true
    t.index ["user_id"], name: "index_progress_entries_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "email", null: false
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "commitment_target"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "commitments", "images"
  add_foreign_key "commitments", "users"
  add_foreign_key "progress_entries", "images"
  add_foreign_key "progress_entries", "users"
end
