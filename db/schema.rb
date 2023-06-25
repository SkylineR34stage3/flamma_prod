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

ActiveRecord::Schema[7.0].define(version: 2023_06_25_150514) do
  create_table "posts", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "slug", null: false
    t.datetime "last_activity", null: false
    t.string "post_type", null: false
    t.integer "comment_count", null: false
    t.integer "rating", null: false
    t.boolean "is_commentable", null: false
    t.boolean "is_visible", null: false
    t.boolean "is_draft", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "nickname"
    t.string "email"
    t.string "name"
    t.string "surname"
    t.string "avatar"
    t.string "location"
    t.string "about_me"
    t.string "contact_info"
    t.string "company"
    t.string "position"
    t.string "slug"
    t.string "role"
    t.boolean "activity_status"
    t.boolean "is_rejected"
    t.date "reject_date"
    t.string "reject_reason"
    t.boolean "is_banned"
    t.date "ban_date"
    t.string "ban_reason"
    t.string "telegram_id"
    t.string "respect"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "posts", "users"
end
