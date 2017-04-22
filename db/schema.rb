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

ActiveRecord::Schema.define(version: 20170420214502) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conversations", force: :cascade do |t|
    t.integer  "lead_id"
    t.integer  "representative_id"
    t.integer  "company_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["company_id"], name: "index_conversations_on_company_id", using: :btree
    t.index ["lead_id"], name: "index_conversations_on_lead_id", using: :btree
    t.index ["representative_id"], name: "index_conversations_on_representative_id", using: :btree
  end

  create_table "leads", force: :cascade do |t|
    t.string   "phone"
    t.integer  "representative_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "first_name"
    t.string   "last_name"
    t.index ["representative_id"], name: "index_leads_on_representative_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.string   "to"
    t.string   "from"
    t.string   "status"
    t.string   "body"
    t.string   "message_sid"
    t.string   "account_sid"
    t.string   "messaging_service_sid"
    t.string   "direction"
    t.integer  "conversation_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "representative_id"
    t.index ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree
    t.index ["representative_id"], name: "index_messages_on_representative_id", using: :btree
  end

  create_table "representatives", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "company_id"
    t.string   "type"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.index ["email"], name: "index_representatives_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_representatives_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "conversations", "companies"
  add_foreign_key "conversations", "leads"
  add_foreign_key "conversations", "representatives"
  add_foreign_key "leads", "representatives"
  add_foreign_key "messages", "conversations"
end
