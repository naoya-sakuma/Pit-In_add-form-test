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

ActiveRecord::Schema.define(version: 2021_01_20_144447) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "goals", force: :cascade do |t|
    t.string "title"
    t.date "day_to_start"
    t.string "purpose"
    t.string "status"
    t.text "when_succeed"
    t.text "when_fail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.date "day_to_finish"
    t.index ["user_id"], name: "index_goals_on_user_id"
  end

  create_table "problems", force: :cascade do |t|
    t.string "title", null: false
    t.string "done"
    t.bigint "goal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "working"
    t.index ["goal_id"], name: "index_problems_on_goal_id"
  end

  create_table "solutions", force: :cascade do |t|
    t.string "title"
    t.string "working"
    t.string "done"
    t.bigint "problem_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["problem_id"], name: "index_solutions_on_problem_id"
  end

  create_table "steps", force: :cascade do |t|
    t.string "title"
    t.string "done"
    t.bigint "user_id"
    t.bigint "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "working"
    t.index ["task_id"], name: "index_steps_on_task_id"
    t.index ["user_id"], name: "index_steps_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title"
    t.string "done"
    t.bigint "user_id"
    t.bigint "solution_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "working"
    t.index ["solution_id"], name: "index_tasks_on_solution_id"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.text "introduction"
    t.text "icon"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "provider", default: "", null: false
    t.string "uid", default: "", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "goals", "users"
  add_foreign_key "problems", "goals"
  add_foreign_key "solutions", "problems"
  add_foreign_key "steps", "tasks"
  add_foreign_key "steps", "users"
  add_foreign_key "tasks", "solutions"
  add_foreign_key "tasks", "users"
end
