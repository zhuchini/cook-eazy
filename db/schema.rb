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

ActiveRecord::Schema.define(version: 2019_06_06_150505) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cooked_recipes", force: :cascade do |t|
    t.bigint "recipe_id"
    t.bigint "user_id"
    t.index ["recipe_id"], name: "index_cooked_recipes_on_recipe_id"
    t.index ["user_id"], name: "index_cooked_recipes_on_user_id"
  end

  create_table "fridge_items", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "ingredient_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingredient_id"], name: "index_fridge_items_on_ingredient_id"
    t.index ["user_id"], name: "index_fridge_items_on_user_id"
  end

  create_table "grocery_items", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "ingredient_id"
    t.integer "quantity"
    t.boolean "checked", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingredient_id"], name: "index_grocery_items_on_ingredient_id"
    t.index ["user_id"], name: "index_grocery_items_on_user_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.string "unit_of_measure"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category"
  end

  create_table "recipe_items", force: :cascade do |t|
    t.bigint "recipe_id"
    t.bigint "ingredient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity"
    t.index ["ingredient_id"], name: "index_recipe_items_on_ingredient_id"
    t.index ["recipe_id"], name: "index_recipe_items_on_recipe_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.integer "prep_time"
    t.integer "cook_time"
    t.integer "servings"
    t.string "steps"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "difficulty"
    t.index ["user_id"], name: "index_recipes_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.integer "rating"
    t.date "date"
    t.bigint "user_id"
    t.bigint "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_reviews_on_recipe_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "steps", force: :cascade do |t|
    t.text "content"
    t.integer "order"
    t.bigint "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_steps_on_recipe_id"
  end

  create_table "tag_items", force: :cascade do |t|
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "recipe_id"
    t.index ["recipe_id"], name: "index_tag_items_on_recipe_id"
    t.index ["tag_id"], name: "index_tag_items_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
    t.string "username"
    t.string "email"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wishlist_items", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_wishlist_items_on_recipe_id"
    t.index ["user_id"], name: "index_wishlist_items_on_user_id"
  end

  add_foreign_key "cooked_recipes", "recipes"
  add_foreign_key "cooked_recipes", "users"
  add_foreign_key "fridge_items", "ingredients"
  add_foreign_key "fridge_items", "users"
  add_foreign_key "grocery_items", "ingredients"
  add_foreign_key "grocery_items", "users"
  add_foreign_key "recipe_items", "ingredients"
  add_foreign_key "recipe_items", "recipes"
  add_foreign_key "recipes", "users"
  add_foreign_key "reviews", "recipes"
  add_foreign_key "reviews", "users"
  add_foreign_key "tag_items", "recipes"
  add_foreign_key "wishlist_items", "recipes"
  add_foreign_key "wishlist_items", "users"
end
