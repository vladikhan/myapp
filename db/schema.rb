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

ActiveRecord::Schema.define(version: 2025_09_05_031613) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "address_phones", force: :cascade do |t|
    t.bigint "address_id", null: false
    t.string "number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_id"], name: "index_address_phones_on_address_id"
  end

  create_table "addresses", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.string "type", null: false
    t.string "postal_code", null: false
    t.string "prefecture", null: false
    t.string "city", null: false
    t.string "address1", null: false
    t.string "address2", null: false
    t.string "company_name", default: "", null: false
    t.string "division_name", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_addresses_on_customer_id"
    t.index ["type", "customer_id"], name: "index_addresses_on_type_and_customer_id", unique: true
  end

  create_table "admin_members", force: :cascade do |t|
    t.string "email", null: false
    t.string "family_name", null: false
    t.string "given_name", null: false
    t.string "family_name_kana", null: false
    t.string "given_name_kana", null: false
    t.string "password_digest"
    t.date "start_date", null: false
    t.date "end_date"
    t.boolean "suspended", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index "lower((email)::text)", name: "index_admin_members_on_LOWER_email", unique: true
    t.index ["family_name_kana", "given_name_kana"], name: "index_admin_members_on_family_name_kana_and_given_name_kana"
  end

  create_table "customers", force: :cascade do |t|
    t.string "email", null: false
    t.string "family_name", null: false
    t.string "given_name", null: false
    t.string "family_name_kana", null: false
    t.string "given_name_kana", null: false
    t.string "gender"
    t.date "birthday"
    t.string "hashed_password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.index "lower((email)::text)", name: "index_customers_on_LOWER_email", unique: true
    t.index ["family_name_kana", "given_name_kana"], name: "index_customers_on_family_name_kana_and_given_name_kana"
  end

  create_table "home_addresses", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.string "postal_code"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "prefecture"
    t.string "city"
    t.string "address1"
    t.string "address2"
    t.string "company_name"
    t.string "division_name"
    t.index ["customer_id"], name: "index_home_addresses_on_customer_id"
  end

  create_table "personal_phones", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.string "number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_personal_phones_on_customer_id"
  end

  create_table "phones", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.bigint "address_id"
    t.string "number"
    t.string "number_for_index"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_id"], name: "index_phones_on_address_id"
    t.index ["customer_id"], name: "index_phones_on_customer_id"
  end

  create_table "staff_events", force: :cascade do |t|
    t.bigint "staff_member_id", null: false
    t.string "type", null: false
    t.datetime "created_at", null: false
    t.index ["created_at"], name: "index_staff_events_on_created_at"
    t.index ["staff_member_id", "created_at"], name: "index_staff_events_on_staff_member_id_and_created_at"
  end

  create_table "staff_members", force: :cascade do |t|
    t.string "email", null: false
    t.string "family_name", null: false
    t.string "given_name", null: false
    t.string "family_name_kana", null: false
    t.string "given_name_kana", null: false
    t.string "password_digest"
    t.date "start_date", null: false
    t.date "end_date"
    t.boolean "suspended", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email_for_index", null: false
    t.index "lower((email)::text)", name: "index_staff_members_on_LOWER_email", unique: true
    t.index ["email_for_index"], name: "index_staff_members_on_email_for_index", unique: true
    t.index ["family_name_kana", "given_name_kana"], name: "index_staff_members_on_family_name_kana_and_given_name_kana"
  end

  create_table "work_addresses", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.string "postal_code"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "city"
    t.string "address1"
    t.string "address2"
    t.string "company_name"
    t.string "prefecture"
    t.string "division_name"
    t.index ["customer_id"], name: "index_work_addresses_on_customer_id"
  end

  add_foreign_key "address_phones", "addresses"
  add_foreign_key "addresses", "customers"
  add_foreign_key "home_addresses", "customers"
  add_foreign_key "personal_phones", "customers"
  add_foreign_key "phones", "addresses"
  add_foreign_key "phones", "customers"
  add_foreign_key "staff_events", "staff_members"
  add_foreign_key "work_addresses", "customers"
end
