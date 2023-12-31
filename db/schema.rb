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

ActiveRecord::Schema[7.0].define(version: 2023_09_21_175157) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "arena_player_body_parts", force: :cascade do |t|
    t.bigint "arena_player_id", null: false
    t.bigint "body_part_id", null: false
    t.integer "health"
    t.string "status_effects"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "equipped"
    t.index ["arena_player_id"], name: "index_arena_player_body_parts_on_arena_player_id"
    t.index ["body_part_id"], name: "index_arena_player_body_parts_on_body_part_id"
  end

  create_table "arena_players", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "affinity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_arena_players_on_user_id"
  end

  create_table "body_parts", force: :cascade do |t|
    t.string "name"
    t.string "affinity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slot"
  end

  create_table "koans", force: :cascade do |t|
    t.string "title"
    t.string "source"
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "mumon_commentary"
  end

  create_table "media_items", force: :cascade do |t|
    t.string "title"
    t.string "media_type"
    t.text "description"
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "media_recommendations", force: :cascade do |t|
    t.bigint "recommender_id", null: false
    t.bigint "recommended_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recommended_id"], name: "index_media_recommendations_on_recommended_id"
    t.index ["recommender_id"], name: "index_media_recommendations_on_recommender_id"
  end

  create_table "quote_me_quotes", force: :cascade do |t|
    t.string "content"
    t.string "attribution"
    t.string "context"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "related_items", force: :cascade do |t|
    t.bigint "media_item_id", null: false
    t.bigint "related_media_item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["media_item_id"], name: "index_related_items_on_media_item_id"
    t.index ["related_media_item_id"], name: "index_related_items_on_related_media_item_id"
  end

  create_table "text_blocks", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "context"
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
    t.string "token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "zen_gardens", force: :cascade do |t|
    t.jsonb "grid", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "arena_player_body_parts", "arena_players"
  add_foreign_key "arena_player_body_parts", "body_parts"
  add_foreign_key "arena_players", "users"
  add_foreign_key "media_recommendations", "media_items", column: "recommended_id"
  add_foreign_key "media_recommendations", "media_items", column: "recommender_id"
  add_foreign_key "related_items", "media_items"
  add_foreign_key "related_items", "media_items", column: "related_media_item_id"
end
