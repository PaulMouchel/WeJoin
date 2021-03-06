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

ActiveRecord::Schema.define(version: 2019_09_19_145400) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "attendances", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "place_id"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_attendances_on_place_id"
    t.index ["user_id"], name: "index_attendances_on_user_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "favorite_place_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "opening_hours", force: :cascade do |t|
    t.bigint "place_id"
    t.integer "day_of_week"
    t.time "open"
    t.time "close"
    t.datetime "valid_from"
    t.datetime "valid_through"
    t.index ["place_id"], name: "index_opening_hours_on_place_id"
  end

  create_table "place_edition_tags", force: :cascade do |t|
    t.bigint "place_edition_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_edition_id"], name: "index_place_edition_tags_on_place_edition_id"
    t.index ["tag_id"], name: "index_place_edition_tags_on_tag_id"
  end

  create_table "place_editions", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.text "description"
    t.float "coffee_price"
    t.float "tea_price"
    t.float "beer_price"
    t.string "wifi_password"
    t.bigint "place_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "wifi_identification"
    t.index ["place_id"], name: "index_place_editions_on_place_id"
  end

  create_table "place_tags", force: :cascade do |t|
    t.bigint "place_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_place_tags_on_place_id"
    t.index ["tag_id"], name: "index_place_tags_on_tag_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.text "description"
    t.float "coffee_price"
    t.float "tea_price"
    t.float "beer_price"
    t.string "wifi_password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "city_id"
    t.boolean "validated", default: false
    t.boolean "reviewed", default: false
    t.string "wifi_identification"
    t.float "latitude"
    t.float "longitude"
    t.index ["city_id"], name: "index_places_on_city_id"
  end

  create_table "rating_comforts", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "place_id"
    t.integer "comforts"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_rating_comforts_on_place_id"
    t.index ["user_id"], name: "index_rating_comforts_on_user_id"
  end

  create_table "rating_noise_levels", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "place_id"
    t.integer "noise_levels"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_rating_noise_levels_on_place_id"
    t.index ["user_id"], name: "index_rating_noise_levels_on_user_id"
  end

  create_table "rating_outlets", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "place_id"
    t.integer "outlets"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_rating_outlets_on_place_id"
    t.index ["user_id"], name: "index_rating_outlets_on_user_id"
  end

  create_table "rating_wifis", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "place_id"
    t.integer "wifis"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_rating_wifis_on_place_id"
    t.index ["user_id"], name: "index_rating_wifis_on_user_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "place_id"
    t.integer "stars"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_ratings_on_place_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.text "description"
    t.boolean "is_admin", default: false
    t.datetime "birth_date"
    t.integer "city_id"
    t.string "profession"
    t.string "contact_url"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "place_edition_tags", "place_editions"
  add_foreign_key "place_edition_tags", "tags"
end
