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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130404083048) do

  create_table "finishgoods", :force => true do |t|
    t.string   "displaydate"
    t.integer  "unita"
    t.integer  "unita2"
    t.integer  "unitb"
    t.integer  "unitc"
    t.integer  "unitd"
    t.date     "procdate"
    t.string   "extprogcode"
    t.string   "prodname"
    t.string   "mach"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "production_details", :force => true do |t|
    t.integer  "production_reason_id"
    t.integer  "time"
    t.string   "production_ukey"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "production_reasons", :force => true do |t|
    t.string   "mc_id"
    t.integer  "seq"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "productiondetails", :force => true do |t|
    t.integer  "productionreason_id"
    t.integer  "time"
    t.string   "production_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "remark"
  end

  create_table "productionreasons", :force => true do |t|
    t.string   "mc_id"
    t.integer  "seq"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "productions", :force => true do |t|
    t.integer  "plannedtime"
    t.string   "staff"
    t.string   "fg_ukey"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "downtime"
    t.integer  "scrap"
  end

  create_table "products", :force => true do |t|
    t.string   "displayid"
    t.string   "nameeng"
    t.string   "nameth"
    t.string   "nameinit"
    t.string   "size"
    t.string   "thmin"
    t.string   "threp"
    t.string   "film"
    t.float    "estw"
    t.float    "wmin"
    t.float    "wmax"
    t.float    "acctw"
    t.integer  "pcspack"
    t.integer  "pcstruck"
    t.float    "wagekg"
    t.string   "wdisplay"
    t.string   "inprod"
    t.float    "pct"
    t.string   "vat"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "staffs", :force => true do |t|
    t.string   "name"
    t.string   "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
