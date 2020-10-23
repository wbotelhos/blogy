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

ActiveRecord::Schema.define(version: 2020_10_20_160408) do

  create_table "articles", force: :cascade do |t|
    t.datetime "published_at"
    t.string "slug", null: false
    t.string "title", null: false
    t.text "body"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_articles_on_slug", unique: true
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.boolean "author", default: false, null: false
    t.boolean "pending", default: true, null: false
    t.integer "parent_id"
    t.string "email", null: false
    t.string "name", null: false
    t.string "url"
    t.text "body", null: false
    t.integer "commentable_id", null: false
    t.string "commentable_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type"
  end

  create_table "labs", force: :cascade do |t|
    t.datetime "published_at"
    t.string "analytics"
    t.text "css_import"
    t.string "description"
    t.text "js"
    t.text "js_import"
    t.string "keywords", null: false
    t.string "slug", null: false
    t.string "title", null: false
    t.string "version", null: false
    t.text "body"
    t.text "js_ready"
    t.text "css"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "index_labs_on_title", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "name", null: false
    t.string "password_hash", null: false
    t.string "password_salt", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
