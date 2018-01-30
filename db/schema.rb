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

ActiveRecord::Schema.define(version: 20180130190121) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "faqposts", force: :cascade do |t|
    t.string "faqpost_title"
    t.text "faqpost_body"
    t.string "faqpost_author"
    t.string "faqpost_editor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hotlinks", force: :cascade do |t|
    t.string "title"
    t.text "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "links", force: :cascade do |t|
    t.text "option"
    t.bigint "section_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["section_id"], name: "index_links_on_section_id"
  end

  create_table "sections", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.boolean "mailer"
    t.string "alert"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sub_sections", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.bigint "section_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["section_id"], name: "index_sub_sections_on_section_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "activation_digest"
    t.boolean "activation"
    t.datetime "activation_at"
  end

  add_foreign_key "links", "sections"
  add_foreign_key "sub_sections", "sections"
end
