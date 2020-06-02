ActiveRecord::Schema.define(version: 20180628133250) do
  create_table "broadcasts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "title"
    t.datetime "broadcast_date"
    t.datetime "created_at"
    t.integer  "subscriptions_count",                 default: 0
  end

  create_table "subscriptions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "broadcast_id"
    t.boolean  "watched",                                  default: false
    t.datetime "created_at"
    t.string   "email",                      limit: 191
    t.string   "firstname"
    t.string   "surname"
    t.string   "registration_ip"
    t.index ["broadcast_id"], name: "broadcast_id", using: :btree
    t.index ["email"], name: "index_subscriptions_on_email", unique: true, using: :btree
  end
end
