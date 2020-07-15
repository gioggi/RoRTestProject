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

ActiveRecord::Schema.define(version: 2020_07_13_223353) do

  create_table "badges", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "released_at"
    t.boolean "active", default: true, null: false
    t.integer "worker_id"
    t.index ["worker_id"], name: "index_badges_on_worker_id"
  end

  create_table "commits", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "tasks_id"
    t.integer "workers_id"
    t.integer "type"
    t.string "note"
    t.index ["tasks_id"], name: "index_commits_on_tasks_id"
    t.index ["workers_id"], name: "index_commits_on_workers_id"
  end

  create_table "projects", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.integer "workers_id"
    t.index ["workers_id"], name: "index_projects_on_workers_id"
  end

  create_table "stamps", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "start_at"
    t.string "end_at"
    t.integer "badges_id"
    t.index ["badges_id"], name: "index_stamps_on_badges_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status"
    t.string "description"
    t.datetime "deadline"
  end

  create_table "tasks_workers", id: false, force: :cascade do |t|
    t.integer "worker_id", null: false
    t.integer "task_id", null: false
    t.index ["task_id"], name: "index_tasks_workers_on_task_id"
    t.index ["worker_id"], name: "index_tasks_workers_on_worker_id"
  end

  create_table "teams", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "workers", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "name_id"
    t.integer "role"
    t.string "name"
    t.string "email"
    t.index ["name_id"], name: "index_workers_on_name_id"
  end

end
