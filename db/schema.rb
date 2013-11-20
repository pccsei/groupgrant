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

ActiveRecord::Schema.define(version: 20131031044719) do

  create_table "authentications", force: true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "token"
    t.string   "token_secret"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "businesses", force: true do |t|
    t.string   "name"
    t.string   "goods"
    t.string   "services"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "charities", force: true do |t|
    t.string   "name"
    t.string   "eid"
    t.string   "needs"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "donors", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_initial"
  end

  create_table "groupgrants", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.date     "goal_date"
    t.decimal  "goal_amount"
    t.integer  "owner_id"
    t.integer  "partner_id"
    t.datetime "completed_date"
    t.boolean  "is_complete"
    t.boolean  "is_enabled"
    t.string   "video_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.decimal  "original_price"
    t.text     "description"
    t.decimal  "discount_price"
    t.integer  "user_id"
    t.string   "image"
    t.integer  "availability"
    t.integer  "buying_option"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "expiration_date"
  end

  create_table "users", force: true do |t|
    t.string   "email",                     default: "", null: false
    t.string   "encrypted_password",        default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",             default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "fb_token_expires_at_token"
    t.string   "fb_token_expires_at"
    t.integer  "rolable_id"
    t.string   "rolable_type"
    t.string   "profile_file_name"
    t.string   "profile_content_type"
    t.integer  "profile_file_size"
    t.datetime "profile_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
