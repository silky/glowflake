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

ActiveRecord::Schema[7.1].define(version: 2024_03_23_162534) do
  create_table "people", force: :cascade do |t|
    t.string "name", null: false
    t.string "image", null: false
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_people_on_email", unique: true
  end

  create_table "tag_work_updates", force: :cascade do |t|
    t.integer "tag_id", null: false
    t.integer "work_update_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id", "work_update_id"], name: "index_tag_work_updates_on_tag_id_and_work_update_id", unique: true
    t.index ["tag_id"], name: "index_tag_work_updates_on_tag_id"
    t.index ["work_update_id"], name: "index_tag_work_updates_on_work_update_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false
    t.string "colour", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "work_updates", force: :cascade do |t|
    t.integer "person_id", null: false
    t.string "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_work_updates_on_person_id"
  end

  add_foreign_key "tag_work_updates", "tags"
  add_foreign_key "tag_work_updates", "work_updates"
  add_foreign_key "work_updates", "people"
end
