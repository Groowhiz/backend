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

ActiveRecord::Schema.define(version: 10) do

  create_table "accounts", force: :cascade do |t|
    t.string   "first_name",       limit: 255
    t.string   "last_name",        limit: 255
    t.string   "email",            limit: 255
    t.string   "crypted_password", limit: 255
    t.string   "role",             limit: 255
    t.string   "location",         limit: 255
    t.string   "display_image",    limit: 255
    t.string   "sex",              limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accounts", ["email"], name: "index_accounts_on_email", unique: true, using: :btree

  create_table "project_applications", force: :cascade do |t|
    t.integer  "project_id",       limit: 4
    t.integer  "user_id",          limit: 4
    t.string   "user_talent_link", limit: 255
    t.integer  "user_talent_id",   limit: 4
    t.string   "status",           limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_collaborations", force: :cascade do |t|
    t.integer  "user_id",        limit: 4
    t.integer  "user_talent_id", limit: 4
    t.integer  "project_id",     limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_skills", force: :cascade do |t|
    t.integer "project_id", limit: 4
    t.integer "talent_id",  limit: 4
  end

  create_table "projects", force: :cascade do |t|
    t.integer  "user_id",       limit: 4
    t.string   "category",      limit: 255
    t.string   "title",         limit: 255
    t.text     "description",   limit: 65535
    t.string   "location",      limit: 255
    t.string   "display_image", limit: 255
    t.string   "status",        limit: 255
    t.string   "link",          limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "talent_uploads", force: :cascade do |t|
    t.text     "description", limit: 65535
    t.string   "link",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "talents", force: :cascade do |t|
    t.string "talent",     limit: 255
    t.string "sub_talent", limit: 255
  end

  create_table "user_talent_uploads", force: :cascade do |t|
    t.integer "user_id",          limit: 4
    t.integer "talent_upload_id", limit: 4
    t.integer "talent_id",        limit: 4
  end

  create_table "user_talents", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "talent_id",  limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
