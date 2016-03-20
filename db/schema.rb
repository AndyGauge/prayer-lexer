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

ActiveRecord::Schema.define(version: 20160317020808) do

  create_table "topics", force: :cascade do |t|
    t.text     "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "verses", force: :cascade do |t|
    t.text     "slug"
    t.text     "book"
    t.text     "chapter"
    t.text     "verse"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "tally"
    t.integer  "verse_id"
    t.integer  "topic_id"
    t.integer  "verse_end_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "votes", ["topic_id"], name: "index_votes_on_topic_id"
  add_index "votes", ["verse_end_id"], name: "index_votes_on_verse_end_id"
  add_index "votes", ["verse_id"], name: "index_votes_on_verse_id"

end
