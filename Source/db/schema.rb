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

ActiveRecord::Schema.define(version: 20150528181313) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string   "name",       null: false
    t.text     "biography"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "color",      null: false
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "categories", ["user_id"], name: "index_categories_on_user_id", using: :btree

  create_table "password_recovery_tokens", force: :cascade do |t|
    t.string   "recovery_token",    null: false
    t.datetime "request_timestamp", null: false
    t.integer  "user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "password_recovery_tokens", ["user_id"], name: "index_password_recovery_tokens_on_user_id", using: :btree

  create_table "privileges", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "quotes", force: :cascade do |t|
    t.text     "text",        null: false
    t.text     "source"
    t.datetime "datetime",    null: false
    t.text     "comment"
    t.boolean  "favorite"
    t.string   "rate"
    t.integer  "category_id"
    t.integer  "author_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "quotes", ["author_id"], name: "index_quotes_on_author_id", using: :btree
  add_index "quotes", ["category_id"], name: "index_quotes_on_category_id", using: :btree

  create_table "quotes_tags", id: false, force: :cascade do |t|
    t.integer "quote_id"
    t.integer "tag_id"
  end

  add_index "quotes_tags", ["quote_id"], name: "index_quotes_tags_on_quote_id", using: :btree
  add_index "quotes_tags", ["tag_id"], name: "index_quotes_tags_on_tag_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",            null: false
    t.string   "username",        null: false
    t.string   "email",           null: false
    t.string   "password",        null: false
    t.string   "salt",            null: false
    t.integer  "privilege_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["privilege_id"], name: "index_users_on_privilege_id", using: :btree

  add_foreign_key "categories", "users"
  add_foreign_key "password_recovery_tokens", "users"
  add_foreign_key "quotes", "authors"
  add_foreign_key "quotes", "categories"
  add_foreign_key "users", "privileges"
end
