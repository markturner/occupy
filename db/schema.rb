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

ActiveRecord::Schema.define(:version => 20111120154322) do

  create_table "camps", :force => true do |t|
    t.string   "city"
    t.string   "main_location"
    t.string   "second_location"
    t.string   "map_address"
    t.string   "country"
    t.string   "start_date"
    t.string   "max_numbers"
    t.string   "more_one_day"
    t.string   "numbers_source"
    t.string   "image_url"
    t.string   "icon_1"
    t.string   "icon_2"
    t.string   "icon_3"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latitude"
    t.float    "longitude"
  end

end
