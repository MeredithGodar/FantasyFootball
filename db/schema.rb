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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131212224101) do

  create_table "players", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "position"
    t.string   "team"
    t.string   "college"
    t.string   "birthdate"
    t.string   "user"
    t.string   "height"
    t.string   "weight"
    t.string   "url"
    t.string   "number"
<<<<<<< HEAD
    t.integer  "stat_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "stats", :force => true do |t|
    t.integer  "player_id"
    t.integer  "pass_att"
    t.integer  "pass_comp"
    t.integer  "pass_yrd"
    t.integer  "pass_td"
    t.integer  "int"
    t.integer  "rush_att"
    t.integer  "rush_yrd"
    t.integer  "rush_td"
    t.integer  "fumble"
    t.integer  "rec_yrd"
    t.integer  "rec_td"
    t.integer  "rec"
    t.integer  "kick_att"
    t.integer  "kick_fg"
    t.integer  "kick_pat"
=======
>>>>>>> 0c04f9808d20f91e53ac1465d698fb775bfa8c7a
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "name"
    t.string   "provider"
    t.string   "uid"
    t.string   "session_token"
    t.integer  "player_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
