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

ActiveRecord::Schema[7.0].define(version: 2022_09_28_154442) do
  create_table "comments", force: :cascade do |t|
    t.integer "author_id_id", null: false
    t.integer "post_id_id", null: false
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id_id"], name: "index_comments_on_author_id_id"
    t.index ["post_id_id"], name: "index_comments_on_post_id_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "author_id_id", null: false
    t.integer "post_id_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id_id"], name: "index_likes_on_author_id_id"
    t.index ["post_id_id"], name: "index_likes_on_post_id_id"
  end

  create_table "posts", force: :cascade do |t|
    t.integer "author_id"
    t.string "title"
    t.text "text"
    t.integer "comments_counter"
    t.integer "likes_counter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "Name"
    t.text "Photo"
    t.text "Bio"
    t.integer "PostsCounter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comments", "author_ids"
  add_foreign_key "comments", "post_ids"
  add_foreign_key "likes", "author_ids"
  add_foreign_key "likes", "post_ids"
  add_foreign_key "posts", "users"
end
