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

ActiveRecord::Schema.define(:version => 20110825205957) do

  create_table "activities", :force => true do |t|
    t.integer  "user_id"
    t.string   "activity_name"
    t.string   "activity_description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cuisines", :force => true do |t|
    t.integer  "place_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cuisines_places", :id => false, :force => true do |t|
    t.integer "cuisine_id"
    t.integer "place_id"
  end

  create_table "images", :force => true do |t|
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", :force => true do |t|
    t.integer  "parent_id"
    t.integer  "receiver_id"
    t.integer  "sender_id"
    t.string   "subject"
    t.text     "content"
    t.boolean  "read",        :default => false
    t.boolean  "archived",    :default => false
    t.boolean  "spam",        :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "moods", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "moods_places", :id => false, :force => true do |t|
    t.integer "mood_id"
    t.integer "place_id"
  end

  add_index "moods_places", ["mood_id"], :name => "index_moods_places_on_mood_id"
  add_index "moods_places", ["place_id"], :name => "index_moods_places_on_place_id"

  create_table "places", :force => true do |t|
    t.string   "sharer_id"
    t.string   "name"
    t.string   "slug"
    t.string   "price_range"
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "zipcode"
    t.float    "latitude"
    t.float    "longitude"
    t.text     "hours"
    t.text     "parking"
    t.text     "payment"
    t.string   "phone_number"
    t.string   "website"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "places", ["slug"], :name => "index_places_on_slug", :unique => true

  create_table "profiles", :force => true do |t|
    t.integer  "user_id"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "phone_number"
    t.text     "description"
    t.string   "gender"
    t.string   "birth_day"
    t.string   "birth_month"
    t.string   "birth_year"
    t.string   "relationship_status"
    t.string   "occupation"
    t.string   "school"
    t.string   "company"
    t.string   "website"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "flickr"
    t.string   "linkedin"
    t.text     "languages"
    t.text     "hobbies"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relationships", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], :name => "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], :name => "index_relationships_on_follower_id_and_followed_id", :unique => true
  add_index "relationships", ["follower_id"], :name => "index_relationships_on_follower_id"

  create_table "thoughts", :force => true do |t|
    t.integer  "user_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
