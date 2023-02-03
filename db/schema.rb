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

ActiveRecord::Schema[7.0].define(version: 2023_02_03_180836) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "order_details", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "product_id", null: false
    t.integer "quantity", default: 1, null: false
    t.decimal "subtotal", precision: 12, scale: 2, default: "0.0", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_order_details_on_deleted_at"
    t.index ["order_id"], name: "index_order_details_on_order_id"
    t.index ["product_id"], name: "index_order_details_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.date "date"
    t.string "status", default: "new"
    t.decimal "total", precision: 12, scale: 2, default: "0.0", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "confirmed_by"
    t.string "cancel_reason"
    t.integer "cancelled_by"
    t.date "cancelled_date"
    t.date "confirm_date"
    t.index ["deleted_at"], name: "index_orders_on_deleted_at"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "product_likes", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "user_id", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_product_likes_on_deleted_at"
    t.index ["product_id"], name: "index_product_likes_on_product_id"
    t.index ["user_id"], name: "index_product_likes_on_user_id"
  end

  create_table "product_transactions", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "user_id", null: false
    t.bigint "order_id"
    t.integer "affected_qty", null: false
    t.integer "old_balance", null: false
    t.integer "new_balance", null: false
    t.string "transaction_type", null: false
    t.string "operation", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_product_transactions_on_deleted_at"
    t.index ["order_id"], name: "index_product_transactions_on_order_id"
    t.index ["product_id"], name: "index_product_transactions_on_product_id"
    t.index ["user_id"], name: "index_product_transactions_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.integer "stock", default: 0, null: false
    t.string "sku"
    t.decimal "price", precision: 12, scale: 2, default: "0.0", null: false
    t.string "status", default: "out_of_stock"
    t.text "description"
    t.integer "product_like_count"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_products_on_deleted_at"
    t.index ["sku"], name: "index_products_on_sku", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "names", null: false
    t.string "last_names", null: false
    t.string "email", null: false
    t.string "phone", null: false
    t.string "role", default: "user"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["phone"], name: "index_users_on_phone", unique: true
  end

  add_foreign_key "order_details", "orders"
  add_foreign_key "order_details", "products"
  add_foreign_key "orders", "users"
  add_foreign_key "product_likes", "products"
  add_foreign_key "product_likes", "users"
  add_foreign_key "product_transactions", "products"
  add_foreign_key "product_transactions", "users"

  create_view "top_products", sql_definition: <<-SQL
      SELECT p.id,
      p.name,
      sum(od.quantity) AS sells,
      sum(((od.quantity)::numeric * p.price)) AS amount
     FROM ((products p
       JOIN order_details od ON ((p.id = od.product_id)))
       JOIN orders o ON ((o.id = od.order_id)))
    WHERE ((o.status)::text = 'confirmed'::text)
    GROUP BY p.id, p.name
    ORDER BY (sum(od.quantity)) DESC;
  SQL
  create_view "popular_products", sql_definition: <<-SQL
      SELECT p.id,
      p.name,
      count(pl.product_id) AS likes
     FROM (products p
       JOIN product_likes pl ON ((p.id = pl.product_id)))
    GROUP BY p.id, p.name
    ORDER BY (count(pl.product_id)) DESC;
  SQL
end
