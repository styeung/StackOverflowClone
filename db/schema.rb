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

ActiveRecord::Schema.define(version: 20141001131914) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: true do |t|
    t.integer  "question_id", null: false
    t.text     "answer_text", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answers", ["answer_text"], name: "index_answers_on_answer_text", using: :btree
  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree

  create_table "questions", force: true do |t|
    t.text     "question_name", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["question_name"], name: "index_questions_on_question_name", using: :btree

  create_table "upvotes", force: true do |t|
    t.integer  "answer_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "upvotes", ["answer_id"], name: "index_upvotes_on_answer_id", using: :btree

end
