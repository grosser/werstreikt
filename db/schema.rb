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

ActiveRecord::Schema.define(:version => 20110328181413) do

  create_table "strikes", :force => true do |t|
    t.date     "start_on"
    t.date     "end_on"
    t.integer  "creator_id",   :null => false
    t.string   "organisation", :null => false
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "source"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "fb_id"
    t.integer  "gender_id",  :default => 0, :null => false
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["fb_id"], :name => "index_users_on_fb_id", :unique => true

end
