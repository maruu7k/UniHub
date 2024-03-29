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

ActiveRecord::Schema.define(version: 2022_06_26_223252) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.text "message", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "university_id", null: false
    t.text "description"
    t.index ["university_id"], name: "index_courses_on_university_id"
  end

  create_table "courses_degrees", id: false, force: :cascade do |t|
    t.bigint "degree_id", null: false
    t.bigint "course_id", null: false
    t.index ["course_id", "degree_id"], name: "index_courses_degrees_on_course_id_and_degree_id"
    t.index ["degree_id", "course_id"], name: "index_courses_degrees_on_degree_id_and_course_id"
  end

  create_table "degrees", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "degrees_universities", id: false, force: :cascade do |t|
    t.bigint "university_id", null: false
    t.bigint "degree_id", null: false
    t.index ["degree_id", "university_id"], name: "index_degrees_universities_on_degree_id_and_university_id"
    t.index ["university_id", "degree_id"], name: "index_degrees_universities_on_university_id_and_degree_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "imageable_type"
    t.bigint "imageable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["imageable_type", "imageable_id"], name: "index_images_on_imageable"
  end

  create_table "unihub_applications", force: :cascade do |t|
    t.integer "current_qualification", default: 0, null: false
    t.integer "interested_qualification", default: 0, null: false
    t.boolean "accomodation_required", default: false, null: false
    t.integer "status", default: 0, null: false
    t.bigint "country_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "cgpa_or_percentage", default: "", null: false
    t.string "current_institution", default: "", null: false
    t.bigint "university_id", null: false
    t.bigint "course_id"
    t.bigint "degree_id"
    t.index ["country_id"], name: "index_unihub_applications_on_country_id"
    t.index ["course_id"], name: "index_unihub_applications_on_course_id"
    t.index ["degree_id"], name: "index_unihub_applications_on_degree_id"
    t.index ["university_id"], name: "index_unihub_applications_on_university_id"
    t.index ["user_id"], name: "index_unihub_applications_on_user_id"
  end

  create_table "universities", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.bigint "country_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "description"
    t.string "world_ranking", default: "", null: false
    t.string "tuition_fee", default: "", null: false
    t.string "ielts_score", default: "not_required", null: false
    t.string "intake", default: "", null: false
    t.index ["country_id"], name: "index_universities_on_country_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.integer "age", default: 0, null: false
    t.string "city", default: "", null: false
    t.string "phone_number", default: "", null: false
    t.string "interested_program"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "courses", "universities"
  add_foreign_key "unihub_applications", "countries"
  add_foreign_key "unihub_applications", "courses"
  add_foreign_key "unihub_applications", "degrees"
  add_foreign_key "unihub_applications", "universities"
  add_foreign_key "unihub_applications", "users"
  add_foreign_key "universities", "countries"
end
