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

ActiveRecord::Schema.define(:version => 20091220013610) do


  create_table "anotes", :force => true do |t|
    t.string   "name"
    t.string   "tel"
    t.string   "phone"
    t.date     "birth",          :default => '1980-01-01'
    t.string   "email"
    t.string   "major"
    t.string   "school"
    t.string   "education"
    t.string   "degree"
    t.text     "question"
    t.text     "resume"
    t.string   "english_type"
    t.string   "english_record"
    t.string   "plan_level"
    t.string   "plan_major"
    t.date     "plan_date"
    t.boolean  "is_reply",       :default => false
    t.string   "replyer"
    t.text     "answer"
    t.boolean  "is_display",     :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bnotes", :force => true do |t|
    t.string   "name"
    t.string   "sex"
    t.string   "provance"
    t.string   "city"
    t.date     "birth",                :default => '1980-01-01'
    t.string   "tel"
    t.string   "contact_time"
    t.string   "fax"
    t.string   "email"
    t.string   "like_country"
    t.string   "relative_info"
    t.string   "self_info"
    t.string   "self_education"
    t.string   "self_english"
    t.string   "self_france"
    t.string   "mate_education"
    t.string   "mate_english"
    t.string   "mate_france"
    t.string   "asset_cash"
    t.string   "asset_house"
    t.string   "asset_bond"
    t.string   "asset_company"
    t.date     "a_started_at"
    t.date     "a_ended_at"
    t.string   "a_job"
    t.string   "a_revenue"
    t.string   "a_company_type"
    t.string   "a_registered_capital"
    t.string   "a_stock"
    t.string   "a_sale"
    t.string   "a_benefit"
    t.date     "b_started_at"
    t.date     "b_ended_at"
    t.string   "b_job"
    t.string   "b_revenue"
    t.string   "b_company_type"
    t.string   "b_registered_capital"
    t.string   "b_stock"
    t.string   "b_sale"
    t.string   "b_benefit"
    t.text     "question"
    t.boolean  "is_reply",             :default => false
    t.boolean  "is_display",           :default => true
    t.string   "replyer"
    t.text     "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gnotes", :force => true do |t|
    t.string   "name"
    t.string   "tel"
    t.string   "phone"
    t.date     "birth"
    t.string   "email"
    t.text     "question"
    t.boolean  "is_reply",   :default => false
    t.string   "replyer",    :default => "admin"
    t.text     "answer"
    t.boolean  "is_display", :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", :force => true do |t|
    t.integer  "project_id"
    t.integer  "typo",           :default => 0
    t.string   "title"
    t.string   "stitle"
    t.string   "title_style"
    t.string   "author"
    t.string   "source"
    t.string   "tags"
    t.string   "property",       :default => "0,0,0,0,0,0,0,0"
    t.text     "info"
    t.string   "metakeywords",   :default => "亚美经济文化"
    t.string   "metadesc",       :default => "亚美经济文化"
    t.boolean  "is_use_templet", :default => false
    t.string   "templet"
    t.boolean  "is_image",       :default => false
    t.integer  "image_id"
    t.string   "image_url"
    t.integer  "visit_count",    :default => 0
    t.integer  "digg_count",     :default => 0
    t.boolean  "is_comment",     :default => false
    t.boolean  "is_lock",        :default => false
    t.boolean  "is_recyle",      :default => false
    t.boolean  "is_html",        :default => false
    t.string   "file_path"
    t.boolean  "is_vote",        :default => false
    t.boolean  "is_display",     :default => true
    t.boolean  "is_list_top",    :default => false
    t.integer  "sort_id",        :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", :primary_key => "job_id", :force => true do |t|
    t.integer  "parent_id"
    t.string   "title"
    t.string   "location"
    t.string   "number"
    t.string   "experience"
    t.string   "language"
    t.string   "education"
    t.string   "salary"
    t.text     "description"
    t.string   "email"
    t.date     "started_at"
    t.date     "ended_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "manages", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
  end

  create_table "projects", :force => true do |t|
    t.integer  "parent_id",  :default => 0
    t.string   "cn_name"
    t.string   "en_name"
    t.string   "url"
    t.boolean  "is_leaf",    :default => true
    t.boolean  "is_display", :default => true
    t.integer  "sort_id",    :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "searches", :force => true do |t|
    t.string   "q"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "signs", :force => true do |t|
    t.integer  "user_id"
    t.boolean  "is_contract"
    t.string   "record_code"
    t.boolean  "is_valid"
    t.text     "memo"
    t.string   "name"
    t.string   "sex"
    t.date     "birth"
    t.string   "birth_address"
    t.string   "marry"
    t.string   "tel"
    t.string   "phone"
    t.string   "qq"
    t.string   "fax"
    t.string   "address"
    t.string   "zip"
    t.text     "edu_exprience"
    t.text     "work_exprience"
    t.string   "language"
    t.string   "language_record"
    t.date     "exam_date"
    t.string   "a_school"
    t.string   "a_major"
    t.string   "a_edu"
    t.string   "a_year"
    t.string   "b_major"
    t.string   "b_edu"
    t.string   "b_year"
    t.date     "begin_date"
    t.string   "language_type"
    t.string   "language_degree"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "step",            :default => 1
  end

  create_table "sites", :force => true do |t|
    t.string   "login"
    t.string   "password"
    t.string   "company_name"
    t.string   "site_url"
    t.string   "address"
    t.string   "phone"
    t.string   "fax"
    t.string   "email"
    t.text     "site_footer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type"], :name => "index_taggings_on_taggable_id_and_taggable_type"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
  end

end
