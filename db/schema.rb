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

ActiveRecord::Schema.define(:version => 20101130052456) do

  create_table "addresses", :force => true do |t|
    t.string   "street"
    t.string   "city"
    t.integer  "state_id"
    t.integer  "country_id"
    t.string   "postal_code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "addressable_id"
    t.string   "addressable_type"
  end

  create_table "beers", :force => true do |t|
    t.string   "name"
    t.integer  "brewery_id"
    t.text     "description"
    t.decimal  "abv"
    t.decimal  "ibu"
    t.decimal  "original_gravity"
    t.integer  "style_id"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "breweries", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.string   "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "countries", :force => true do |t|
    t.string   "iso"
    t.string   "name"
    t.string   "iso3"
    t.integer  "numcode"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "places", :force => true do |t|
    t.string   "name"
    t.string   "group"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.string   "website"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.string   "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "states", :force => true do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "styles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
