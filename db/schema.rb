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

ActiveRecord::Schema.define(version: 2020_03_19_134133) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pokemon_type", force: :cascade do |t|
    t.bigint "pokemon_id"
    t.bigint "type_id"
    t.index ["pokemon_id"], name: "index_pokemon_type_on_pokemon_id"
    t.index ["type_id"], name: "index_pokemon_type_on_type_id"
  end

  create_table "pokemon_types", force: :cascade do |t|
    t.integer "pokemon_id"
    t.integer "type_id"
  end

  create_table "pokemons", force: :cascade do |t|
    t.string "name"
    t.integer "number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "pokemon_type", "pokemons"
  add_foreign_key "pokemon_type", "types"
end
