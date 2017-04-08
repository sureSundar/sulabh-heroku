# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20170408083045) do

  create_table "sulabh_addresses", force: :cascade do |t|
    t.string   "address1"
    t.string   "address2"
    t.string   "address3"
    t.string   "city"
    t.decimal  "pincode",                precision: 6
    t.string   "country"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "sulabh_user_profile_id"
  end

  add_index "sulabh_addresses", ["sulabh_user_profile_id"], name: "index_sulabh_addresses_on_sulabh_user_profile_id"

  create_table "sulabh_financials", force: :cascade do |t|
    t.decimal  "loanamount"
    t.decimal  "policypremium"
    t.decimal  "procfee"
    t.decimal  "approvedintrate"
    t.integer  "installmentcount"
    t.string   "installmentfrequency"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "sulabh_loan_confirms", force: :cascade do |t|
    t.integer  "request_id"
    t.integer  "offer_id"
    t.integer  "policyno_id"
    t.integer  "financedetails_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "sulabh_loan_confirms", ["financedetails_id"], name: "index_sulabh_loan_confirms_on_financedetails_id"
  add_index "sulabh_loan_confirms", ["offer_id"], name: "index_sulabh_loan_confirms_on_offer_id"
  add_index "sulabh_loan_confirms", ["policyno_id"], name: "index_sulabh_loan_confirms_on_policyno_id"
  add_index "sulabh_loan_confirms", ["request_id"], name: "index_sulabh_loan_confirms_on_request_id"

  create_table "sulabh_loan_offers", force: :cascade do |t|
    t.integer  "username_id"
    t.string   "behavescore"
    t.decimal  "offeramount"
    t.datetime "expiresby"
    t.decimal  "offerinterestrate"
    t.datetime "paybydate"
    t.decimal  "interestrate"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "sulabh_loan_offers", ["username_id"], name: "index_sulabh_loan_offers_on_username_id"

  create_table "sulabh_loan_requests", force: :cascade do |t|
    t.integer  "username_id"
    t.string   "behavescore"
    t.decimal  "amount"
    t.datetime "requiredby"
    t.datetime "paybydate"
    t.decimal  "mininterest"
    t.decimal  "maxinterest"
    t.decimal  "interest"
    t.decimal  "minpaybyamount"
    t.decimal  "maxpaybyamount"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "sulabh_loan_requests", ["username_id"], name: "index_sulabh_loan_requests_on_username_id"

  create_table "sulabh_offer_statuses", force: :cascade do |t|
    t.integer  "offer_id"
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sulabh_offer_statuses", ["offer_id"], name: "index_sulabh_offer_statuses_on_offer_id"

  create_table "sulabh_passwords", force: :cascade do |t|
    t.string   "password"
    t.string   "expiry"
    t.string   "pin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sulabh_policies", force: :cascade do |t|
    t.string   "provider"
    t.string   "policyno"
    t.string   "scheme"
    t.decimal  "premium"
    t.datetime "startdate"
    t.datetime "enddate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sulabh_policy_claims", force: :cascade do |t|
    t.string   "policyno"
    t.string   "claimno"
    t.string   "claimstatus"
    t.decimal  "claimedamount"
    t.decimal  "settlementamount"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "sulabh_req_offer_maps", force: :cascade do |t|
    t.integer  "request_id"
    t.integer  "offer_id"
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sulabh_req_offer_maps", ["offer_id"], name: "index_sulabh_req_offer_maps_on_offer_id"
  add_index "sulabh_req_offer_maps", ["request_id"], name: "index_sulabh_req_offer_maps_on_request_id"

  create_table "sulabh_request_statuses", force: :cascade do |t|
    t.integer  "request_id"
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sulabh_request_statuses", ["request_id"], name: "index_sulabh_request_statuses_on_request_id"

  create_table "sulabh_roles", force: :cascade do |t|
    t.string   "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sulabh_user_profiles", force: :cascade do |t|
    t.string   "name"
    t.integer  "address_id"
    t.string   "email"
    t.string   "mobile"
    t.string   "aadhar"
    t.string   "accountno"
    t.string   "ifsc"
    t.string   "bank"
    t.string   "locale"
    t.string   "occupation"
    t.decimal  "monthlyrevenue"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "sulabh_user_profiles", ["address_id"], name: "index_sulabh_user_profiles_on_address_id"

  create_table "sulabh_user_roles", force: :cascade do |t|
    t.integer  "username_id"
    t.integer  "role_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "sulabh_user_roles", ["role_id"], name: "index_sulabh_user_roles_on_role_id"
  add_index "sulabh_user_roles", ["username_id"], name: "index_sulabh_user_roles_on_username_id"

  create_table "sulabh_users", force: :cascade do |t|
    t.string   "username"
    t.integer  "password_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "sulabh_users", ["password_id"], name: "index_sulabh_users_on_password_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                         default: ""
    t.string   "encrypted_password",            default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                 default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.integer  "second_factor_attempts_count",  default: 0
    t.string   "encrypted_otp_secret_key"
    t.string   "encrypted_otp_secret_key_iv"
    t.string   "encrypted_otp_secret_key_salt"
    t.string   "phoneno"
    t.string   "otp_secret_key"
    t.string   "aadhar"
  end

  add_index "users", ["encrypted_otp_secret_key"], name: "index_users_on_encrypted_otp_secret_key", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
