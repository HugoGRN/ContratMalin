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

ActiveRecord::Schema[7.0].define(version: 2023_06_08_124123) do
  create_table "contrats", force: :cascade do |t|
    t.string "name_contrat"
    t.integer "information_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.string "gender"
    t.string "name"
    t.string "first_name"
    t.date "birthday"
    t.string "place_birth"
    t.string "registered_ordre"
    t.integer "n_ordinal"
    t.string "address_pro"
    t.string "email"
    t.date "start_date"
    t.date "end_date"
    t.integer "retro"
    t.integer "payment_limit"
    t.integer "rayon_install"
    t.string "conflict_order"
    t.date "made_on"
    t.string "to"
    t.integer "n_urssaf"
    t.integer "nb_refus"
    t.integer "blackout_period"
    t.string "status"
    t.index ["information_id"], name: "index_contrats_on_information_id"
    t.index ["user_id"], name: "index_contrats_on_user_id"
  end

  create_table "information", force: :cascade do |t|
    t.string "name"
    t.string "first_name"
    t.date "birthday"
    t.string "place_birth"
    t.string "gender"
    t.string "diploma"
    t.date "graduation_date"
    t.string "place_diploma"
    t.integer "n_ordinal"
    t.string "registered_ordre"
    t.string "name_street"
    t.string "address_pro"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.integer "street_number"
    t.string "address_complement"
    t.integer "zip_code"
    t.string "city"
    t.string "country"
    t.string "usage_name"
    t.string "nationality"
    t.integer "n_secu"
    t.integer "rpps"
    t.index ["user_id"], name: "index_information_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "contrats", "information"
  add_foreign_key "contrats", "users"
  add_foreign_key "information", "users"
end
