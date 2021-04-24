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

ActiveRecord::Schema.define(version: 2021_04_24_052156) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.bigint "drill_id"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["drill_id"], name: "index_answers_on_drill_id"
  end

  create_table "drillgroups", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "level"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "value"
  end

  create_table "drills", force: :cascade do |t|
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "drillgroup_id"
    t.index ["drillgroup_id"], name: "index_drills_on_drillgroup_id"
  end

  create_table "points", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "drillgroup_id"
    t.float "score"
    t.integer "taken", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["drillgroup_id"], name: "index_points_on_drillgroup_id"
    t.index ["user_id"], name: "index_points_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_admin", default: false
    t.boolean "is_active", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "answers", "drills"
  add_foreign_key "drills", "drillgroups"
  add_foreign_key "points", "drillgroups"
  add_foreign_key "points", "users"
end
