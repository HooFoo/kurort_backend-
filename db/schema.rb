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

ActiveRecord::Schema.define(version: 20170409213235) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "attachments", force: :cascade do |t|
    t.string   "link"
    t.integer  "comment_id"
    t.integer  "point_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_attachments_on_comment_id", using: :btree
    t.index ["point_id"], name: "index_attachments_on_point_id", using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.string   "text"
    t.integer  "user_id"
    t.integer  "point_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["point_id"], name: "index_comments_on_point_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "langs", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "icon"
    t.string   "key"
  end

  create_table "point_options", force: :cascade do |t|
    t.string   "name"
    t.string   "type_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "point_type_id"
    t.index ["point_type_id"], name: "index_point_options_on_point_type_id", using: :btree
  end

  create_table "point_types", force: :cascade do |t|
    t.string   "name"
    t.string   "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "points", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "lang_id"
    t.float    "lat"
    t.float    "lng"
    t.string   "name"
    t.string   "description"
    t.json     "options"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "point_type_id"
    t.index ["lang_id"], name: "index_points_on_lang_id", using: :btree
    t.index ["point_type_id"], name: "index_points_on_point_type_id", using: :btree
    t.index ["user_id"], name: "index_points_on_user_id", using: :btree
  end

  create_table "user_profile_point_types", force: :cascade do |t|
    t.integer "user_profile_id"
    t.integer "point_type_id"
    t.boolean "enabled"
    t.index ["point_type_id"], name: "index_user_profile_point_types_on_point_type_id", using: :btree
    t.index ["user_profile_id"], name: "index_user_profile_point_types_on_user_profile_id", using: :btree
  end

  create_table "user_profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.integer  "age"
    t.boolean  "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_profiles_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                             default: "", null: false
    t.string   "encrypted_password",                default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.integer  "lang_id"
    t.string   "authentication_token",   limit: 30
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["lang_id"], name: "index_users_on_lang_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "attachments", "comments"
  add_foreign_key "attachments", "points"
  add_foreign_key "comments", "points"
  add_foreign_key "comments", "users"
  add_foreign_key "point_options", "point_types"
  add_foreign_key "points", "langs"
  add_foreign_key "points", "point_types"
  add_foreign_key "points", "users"
  add_foreign_key "user_profile_point_types", "point_types"
  add_foreign_key "user_profile_point_types", "user_profiles"
  add_foreign_key "user_profiles", "users"
  add_foreign_key "users", "langs"
end
