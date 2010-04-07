# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100405182251) do

  create_table "answers", :force => true do |t|
    t.integer  "contributor_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contributors", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.text     "bio"
    t.boolean  "author"
    t.string   "twitter_username"
    t.string   "github_username"
    t.boolean  "on_contributor_page", :default => true, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "elements", :force => true do |t|
    t.integer  "post_id"
    t.integer  "type_id"
    t.string   "title"
    t.text     "link"
    t.text     "summary"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feed_entries", :force => true do |t|
    t.string   "title"
    t.text     "summary"
    t.string   "url"
    t.datetime "published_at"
    t.string   "guid"
    t.integer  "feed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "author"
  end

  create_table "feeds", :force => true do |t|
    t.string   "site_url"
    t.string   "feed_url"
    t.integer  "contributor_id"
    t.boolean  "active"
    t.boolean  "featured"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.string   "name"
  end

  create_table "footer_copy", :force => true do |t|
    t.text "body"
  end

  create_table "notifications", :force => true do |t|
    t.string   "message"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.string   "sidebar_title"
    t.string   "sidebar_subtitle"
    t.string   "slug"
    t.string   "page_title"
    t.string   "page_subtitle"
    t.text     "summary"
    t.text     "body"
    t.string   "contributor_id"
    t.boolean  "show_contributor"
    t.boolean  "published"
    t.datetime "publish_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.string   "sidebar_title"
    t.integer  "contributor_id"
    t.text     "video_embed_link"
    t.string   "github_repo_link"
    t.text     "summary"
    t.text     "body"
    t.datetime "publish_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "published",        :default => true
    t.string   "slug"
    t.string   "skill_level"
    t.boolean  "topic_host"
  end

  create_table "questions", :force => true do |t|
    t.integer  "contributor_id"
    t.text     "body"
    t.string   "asker_name"
    t.string   "asker_link"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "settings", :force => true do |t|
    t.string   "setting_name"
    t.text     "setting_value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                              :null => false
    t.string   "encrypted_password",   :limit => 40, :null => false
    t.string   "password_salt",                      :null => false
    t.string   "confirmation_token",   :limit => 20
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "reset_password_token", :limit => 20
    t.string   "remember_token",       :limit => 20
    t.datetime "remember_created_at"
    t.integer  "sign_in_count"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
