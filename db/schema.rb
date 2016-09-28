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

ActiveRecord::Schema.define(version: 20160926140527) do

  create_table "comments", force: :cascade do |t|
    t.string   "body"
    t.integer  "user_id"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "comments", ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "follows", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "followable_id"
    t.string   "followable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "follows", ["followable_type", "followable_id"], name: "index_follows_on_followable_type_and_followable_id"

  create_table "labels", force: :cascade do |t|
    t.string   "name"
    t.string   "color"
    t.integer  "labelable_id"
    t.string   "labelable_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "labels", ["labelable_type", "labelable_id"], name: "index_labels_on_labelable_type_and_labelable_id"

  create_table "notifications", force: :cascade do |t|
    t.string   "subject"
    t.text     "body"
    t.integer  "recipient_id"
    t.integer  "sender_id"
    t.string   "category"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.string   "body"
    t.integer  "project_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "posts", ["project_id"], name: "index_posts_on_project_id"
  add_index "posts", ["user_id"], name: "index_posts_on_user_id"

  create_table "project_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "project_users", ["project_id"], name: "index_project_users_on_project_id"
  add_index "project_users", ["user_id"], name: "index_project_users_on_user_id"

  create_table "projects", force: :cascade do |t|
    t.string   "title"
    t.datetime "deadline"
    t.datetime "started_at"
    t.integer  "progress",    default: 0
    t.boolean  "archive"
    t.integer  "user_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.text     "description"
  end

  add_index "projects", ["user_id"], name: "index_projects_on_user_id"

  create_table "tasks", force: :cascade do |t|
    t.string   "title"
    t.string   "priority",      default: "normal"
    t.string   "status",        default: "none"
    t.integer  "progress",      default: 0
    t.text     "description"
    t.datetime "started_at"
    t.datetime "due_date"
    t.integer  "taskable_id"
    t.string   "taskable_type"
    t.integer  "user_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "tasks", ["taskable_type", "taskable_id"], name: "index_tasks_on_taskable_type_and_taskable_id"
  add_index "tasks", ["user_id"], name: "index_tasks_on_user_id"

  create_table "users", force: :cascade do |t|
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
    t.string   "name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
