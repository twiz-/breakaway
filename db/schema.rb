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

ActiveRecord::Schema.define(version: 20140922194010) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "club_players", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "club_team"
    t.string   "position"
    t.string   "profile_name"
    t.integer  "grad_year"
    t.string   "formation"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.boolean  "disabled",               default: false
    t.string   "gender"
  end

  add_index "club_players", ["confirmation_token"], name: "index_club_players_on_confirmation_token", unique: true, using: :btree
  add_index "club_players", ["email"], name: "index_club_players_on_email", unique: true, using: :btree
  add_index "club_players", ["reset_password_token"], name: "index_club_players_on_reset_password_token", unique: true, using: :btree

  create_table "college_coaches", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "last_name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.boolean  "disabled",               default: false
    t.boolean  "verified"
  end

  add_index "college_coaches", ["confirmation_token"], name: "index_college_coaches_on_confirmation_token", unique: true, using: :btree
  add_index "college_coaches", ["email"], name: "index_college_coaches_on_email", unique: true, using: :btree
  add_index "college_coaches", ["reset_password_token"], name: "index_college_coaches_on_reset_password_token", unique: true, using: :btree

  create_table "games", force: true do |t|
    t.date     "scheduled_date"
    t.string   "opponent"
    t.text     "location"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "scheduled_time"
    t.integer  "club_player_id"
  end

  create_table "links", force: true do |t|
    t.string   "given_profile_url"
    t.string   "slug"
    t.integer  "clicks",            default: 0
    t.integer  "club_player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "listings", force: true do |t|
    t.string   "video"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "club_player_id"
  end

  add_index "listings", ["club_player_id"], name: "index_listings_on_club_player_id", using: :btree

  create_table "stats", force: true do |t|
    t.string   "clicker"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "link_id"
  end

  create_table "subscriptions", force: true do |t|
    t.integer  "club_player_id"
    t.string   "stripe_token"
    t.integer  "amount"
    t.string   "email"
    t.string   "stripe_customer_id"
    t.string   "stripe_subscription_name"
    t.datetime "created_at"
  end

  create_table "user_friendships", force: true do |t|
    t.integer  "college_coach_id"
    t.integer  "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_friendships", ["college_coach_id"], name: "index_user_friendships_on_college_coach_id", using: :btree
  add_index "user_friendships", ["friend_id"], name: "index_user_friendships_on_friend_id", using: :btree

end
