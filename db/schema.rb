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

ActiveRecord::Schema.define(version: 20171104052647) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "budgets", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "original_amount"
    t.date "start_date"
    t.date "end_date"
    t.integer "remaining_amount"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "extra_used_amount"
    t.index ["user_id"], name: "index_budgets_on_user_id"
  end

  create_table "expenses", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "amount"
    t.date "spent_date"
    t.integer "budget_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["budget_id"], name: "index_expenses_on_budget_id"
  end

  create_table "frequencies", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genders", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "incomes", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "amount"
    t.date "received_date"
    t.integer "user_id"
    t.integer "frequency_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["frequency_id"], name: "index_incomes_on_frequency_id"
    t.index ["user_id"], name: "index_incomes_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "display_name"
    t.string "phone"
    t.date "dob"
    t.string "city"
    t.string "country"
    t.string "address"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "gender_id"
    t.text "image_data"
    t.index ["gender_id"], name: "index_profiles_on_gender_id"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "savings", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "frequency_id"
    t.string "title"
    t.text "description"
    t.integer "amount"
    t.date "saved_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["frequency_id"], name: "index_savings_on_frequency_id"
    t.index ["user_id"], name: "index_savings_on_user_id"
  end

  create_table "sessions", id: :serial, force: :cascade do |t|
    t.string "session_id", null: false
    t.text "data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: ""
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "user_name", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "budgets", "users"
  add_foreign_key "expenses", "budgets"
  add_foreign_key "incomes", "frequencies"
  add_foreign_key "incomes", "users"
  add_foreign_key "profiles", "genders"
  add_foreign_key "profiles", "users"
  add_foreign_key "savings", "frequencies"
  add_foreign_key "savings", "users"
end
