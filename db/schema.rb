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

ActiveRecord::Schema.define(version: 2021_02_27_190053) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "auth_access_policies", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "full_access", default: false, null: false
    t.index ["company_id"], name: "index_auth_access_policies_on_company_id"
  end

  create_table "auth_companies", force: :cascade do |t|
    t.text "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_auth_companies_on_name", unique: true
  end

  create_table "auth_user_email_confirmations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.text "email", null: false
    t.text "token", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["token"], name: "index_auth_user_email_confirmations_on_token", unique: true
    t.index ["user_id"], name: "index_auth_user_email_confirmations_on_user_id", unique: true
  end

  create_table "auth_users", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.text "username", null: false
    t.text "password_digest", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "email"
    t.bigint "access_policy_id", null: false
    t.index ["access_policy_id"], name: "index_auth_users_on_access_policy_id"
    t.index ["company_id"], name: "index_auth_users_on_company_id"
    t.index ["username"], name: "index_auth_users_on_username", unique: true
  end

  add_foreign_key "auth_access_policies", "auth_companies", column: "company_id"
  add_foreign_key "auth_user_email_confirmations", "auth_users", column: "user_id"
  add_foreign_key "auth_users", "auth_access_policies", column: "access_policy_id"
  add_foreign_key "auth_users", "auth_companies", column: "company_id"
end
