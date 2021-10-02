# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_10_02_010214) do

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.integer "course_id"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lessons", force: :cascade do |t|
    t.string "name"
    t.integer "lesson_id"
    t.integer "lesson_number"
    t.string "lesson_text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "section_id", null: false
    t.index ["section_id"], name: "index_lessons_on_section_id"
  end

  create_table "sections", force: :cascade do |t|
    t.string "name"
    t.integer "section_id"
    t.integer "section_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "course_id", null: false
    t.index ["course_id"], name: "index_sections_on_course_id"
  end

  add_foreign_key "lessons", "sections"
  add_foreign_key "sections", "courses"
end
