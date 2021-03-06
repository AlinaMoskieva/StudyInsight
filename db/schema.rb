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

ActiveRecord::Schema.define(version: 20200607102324) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "curriculums", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.bigint "department_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "year"
    t.index ["department_id"], name: "index_curriculums_on_department_id"
  end

  create_table "custom_attributes", force: :cascade do |t|
    t.string "name", null: false
    t.string "value"
    t.string "customizable_type"
    t.bigint "customizable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customizable_type", "customizable_id"], name: "customizable_objects_index"
  end

  create_table "custom_section_units", force: :cascade do |t|
    t.string "name", null: false
    t.string "value"
    t.bigint "custom_section_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["custom_section_id"], name: "index_custom_section_units_on_custom_section_id"
  end

  create_table "custom_sections", force: :cascade do |t|
    t.string "name", null: false
    t.string "value"
    t.string "targetable_type"
    t.bigint "targetable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["targetable_type", "targetable_id"], name: "index_custom_sections_on_targetable_type_and_targetable_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.bigint "institution_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["institution_id"], name: "index_departments_on_institution_id"
  end

  create_table "discipline_programs", force: :cascade do |t|
    t.string "name", null: false
    t.integer "year", null: false
    t.string "description", null: false
    t.bigint "discipline_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discipline_id"], name: "index_discipline_programs_on_discipline_id"
  end

  create_table "disciplines", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.bigint "curriculum_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["curriculum_id"], name: "index_disciplines_on_curriculum_id"
  end

  create_table "institutions", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "description", default: ""
    t.bigint "university_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["university_id"], name: "index_institutions_on_university_id"
  end

  create_table "universities", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "description", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.integer "failed_attempts", default: 0, null: false
    t.string "users"
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "full_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

end
