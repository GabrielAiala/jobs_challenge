# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2024_07_03_042036) do

  create_table "jobs", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.date "start_date"
    t.date "end_date"
    t.integer "status"
    t.text "skill"
    t.integer "recruiter_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recruiter_id"], name: "index_jobs_on_recruiter_id"
  end

  create_table "recruiters", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "jti", null: false
    t.index ["email"], name: "index_recruiters_on_email", unique: true
    t.index ["jti"], name: "index_recruiters_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_recruiters_on_reset_password_token", unique: true
  end

  create_table "submissions", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "mobile_phone"
    t.string "resume"
    t.integer "job_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email", "job_id"], name: "index_submissions_on_email_and_job_id", unique: true
    t.index ["job_id"], name: "index_submissions_on_job_id"
  end

  add_foreign_key "jobs", "recruiters"
  add_foreign_key "submissions", "jobs"
end
