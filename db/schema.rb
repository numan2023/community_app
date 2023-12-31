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

ActiveRecord::Schema[7.0].define(version: 2023_11_13_023303) do
  create_table "active_storage_attachments", charset: "utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "utf8", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", charset: "utf8", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "job_likes", charset: "utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_job_likes_on_job_id"
    t.index ["user_id"], name: "index_job_likes_on_user_id"
  end

  create_table "job_tag_relations", charset: "utf8", force: :cascade do |t|
    t.bigint "job_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_job_tag_relations_on_job_id"
    t.index ["tag_id"], name: "index_job_tag_relations_on_tag_id"
  end

  create_table "jobs", charset: "utf8", force: :cascade do |t|
    t.string "title", null: false
    t.text "content", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_jobs_on_user_id"
  end

  create_table "learning_likes", charset: "utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "learning_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["learning_id"], name: "index_learning_likes_on_learning_id"
    t.index ["user_id"], name: "index_learning_likes_on_user_id"
  end

  create_table "learning_tag_relations", charset: "utf8", force: :cascade do |t|
    t.bigint "learning_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["learning_id"], name: "index_learning_tag_relations_on_learning_id"
    t.index ["tag_id"], name: "index_learning_tag_relations_on_tag_id"
  end

  create_table "learnings", charset: "utf8", force: :cascade do |t|
    t.string "title", null: false
    t.text "content", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_learnings_on_user_id"
  end

  create_table "others", charset: "utf8", force: :cascade do |t|
    t.string "title", null: false
    t.text "content", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_others_on_user_id"
  end

  create_table "tags", charset: "utf8", force: :cascade do |t|
    t.string "tag_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", charset: "utf8", force: :cascade do |t|
    t.string "nickname", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "term", default: "", null: false
    t.string "hobby", default: "", null: false
    t.string "learn_reason", default: "", null: false
    t.string "career_pass", default: "", null: false
    t.string "impressed_app", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "job_likes", "jobs"
  add_foreign_key "job_likes", "users"
  add_foreign_key "job_tag_relations", "jobs"
  add_foreign_key "job_tag_relations", "tags"
  add_foreign_key "jobs", "users"
  add_foreign_key "learning_likes", "learnings"
  add_foreign_key "learning_likes", "users"
  add_foreign_key "learning_tag_relations", "learnings"
  add_foreign_key "learning_tag_relations", "tags"
  add_foreign_key "learnings", "users"
  add_foreign_key "others", "users"
end
