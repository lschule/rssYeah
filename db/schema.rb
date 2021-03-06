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

ActiveRecord::Schema.define(:version => 20121205081356) do

  create_table "articles", :force => true do |t|
    t.text     "name"
    t.text     "summary"
    t.text     "url"
    t.datetime "published"
    t.text     "author"
    t.string   "guid"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "feed_id"
  end

  create_table "feeds", :force => true do |t|
    t.string   "name"
    t.string   "shortname"
    t.string   "url"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.boolean  "fetch",      :default => true
  end

  create_table "feeds_users", :id => false, :force => true do |t|
    t.integer "feed_id"
    t.integer "user_id"
  end

  create_table "recommendations", :force => true do |t|
    t.integer  "from_id"
    t.integer  "to_id"
    t.integer  "article_id"
    t.string   "message"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "saved_searches", :force => true do |t|
    t.string   "query"
    t.datetime "last_access"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.integer  "user_id"
    t.string   "name",        :default => "default name"
  end

  create_table "smart_categories", :force => true do |t|
    t.string   "name"
    t.string   "query"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_articles", :force => true do |t|
    t.integer  "user_id"
    t.integer  "article_id"
    t.boolean  "read"
    t.boolean  "heart"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

end
