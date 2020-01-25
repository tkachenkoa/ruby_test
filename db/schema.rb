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

ActiveRecord::Schema.define(version: 2020_01_25_142528) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachment_binaries", force: :cascade do |t|
    t.integer "attachment_id"
    t.binary "data"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["attachment_id"], name: "index_attachment_binaries_on_attachment_id"
  end

  create_table "attachments", force: :cascade do |t|
    t.integer "owner_id"
    t.string "owner_type"
    t.string "token"
    t.string "digest"
    t.string "role"
    t.string "type"
    t.string "file_name"
    t.string "file_type"
    t.string "cache_type"
    t.string "cache_max_age"
    t.string "disposition"
    t.integer "file_size"
    t.integer "parent_id"
    t.boolean "processed", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "custom"
    t.boolean "serve", default: true
    t.index ["owner_id"], name: "index_attachments_on_owner_id"
    t.index ["token"], name: "index_attachments_on_token"
  end

  create_table "batches", force: :cascade do |t|
    t.integer "batch_id"
    t.date "creation_date"
    t.string "guid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "batch_file"
  end

  create_table "invoice_data_items", force: :cascade do |t|
    t.string "parcel_code"
    t.integer "item_qty"
    t.integer "parcel_price"
    t.bigint "invoice_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["invoice_id", "parcel_code"], name: "index_invoice_data_items_on_invoice_id_and_parcel_code", unique: true
    t.index ["invoice_id"], name: "index_invoice_data_items_on_invoice_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.integer "invoice_operation_number"
    t.date "invoice_operation_date"
    t.string "company_code"
    t.bigint "batch_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["batch_id"], name: "index_invoices_on_batch_id"
    t.index ["id", "invoice_operation_number"], name: "index_invoices_on_id_and_invoice_operation_number", unique: true
  end

  add_foreign_key "invoice_data_items", "invoices"
  add_foreign_key "invoices", "batches"
end
