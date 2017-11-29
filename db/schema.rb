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

ActiveRecord::Schema.define(version: 20171003124540) do

  create_table "colleges", force: :cascade do |t|
    t.integer "school_id"
    t.string "college"
    t.string "abbreviation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_colleges_on_school_id"
  end

  create_table "data", force: :cascade do |t|
    t.integer "type"
    t.string "title"
    t.integer "member_id_id"
    t.string "file_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id_id"], name: "index_data_on_member_id_id"
  end

  create_table "divisions", force: :cascade do |t|
    t.integer "game_id"
    t.string "div"
    t.string "distance"
    t.integer "finisher"
    t.integer "finisher_of_team"
    t.integer "team_rank"
    t.integer "num_of_team"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "note"
    t.index ["game_id"], name: "index_divisions_on_game_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "game"
    t.integer "year"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "game_anchor"
    t.integer "game_type"
  end

  create_table "image_targets", force: :cascade do |t|
    t.string "target"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "path"
  end

  create_table "images", force: :cascade do |t|
    t.binary "image"
    t.string "full_path"
    t.integer "image_target_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "member_id"
    t.boolean "effective"
    t.integer "order"
    t.index ["image_target_id"], name: "index_images_on_image_target_id"
    t.index ["member_id"], name: "index_images_on_member_id"
  end

  create_table "lab_practice_logs", force: :cascade do |t|
    t.integer "member_id"
    t.date "date"
    t.float "swim"
    t.float "bike"
    t.float "run"
    t.text "remark"
    t.float "conversion_distance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "public"
    t.index ["member_id"], name: "index_lab_practice_logs_on_member_id"
  end

  create_table "lab_seminars", force: :cascade do |t|
    t.string "title"
    t.string "theme"
    t.date "date"
    t.string "point_1"
    t.string "point_2"
    t.string "point_3"
    t.string "point_4"
    t.string "point_5"
    t.string "remark"
    t.binary "document"
    t.string "document_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.string "full_name"
    t.string "user_name"
    t.integer "status"
    t.integer "grade"
    t.string "belong"
    t.string "hometown"
    t.string "school"
    t.string "sports"
    t.string "bike"
    t.string "q1"
    t.string "a1"
    t.string "q2"
    t.string "a2"
    t.string "q3"
    t.string "a3"
    t.string "q4"
    t.string "a4"
    t.string "q5"
    t.string "a5"
    t.string "part"
    t.string "addiction"
    t.string "goal"
    t.string "last"
    t.date "graduated_year"
    t.string "remark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "yomigana"
    t.integer "college_id"
    t.string "password_digest"
    t.boolean "administration"
    t.boolean "lab_admin"
  end

  create_table "releasd_infos", force: :cascade do |t|
    t.date "date"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "released_infos", force: :cascade do |t|
    t.date "date"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "link"
  end

  create_table "results", force: :cascade do |t|
    t.date "date"
    t.integer "division_id"
    t.integer "total_rank"
    t.integer "member_id"
    t.time "total_time"
    t.time "s_time"
    t.integer "s_rank"
    t.time "b_time"
    t.integer "b_rank"
    t.time "split"
    t.integer "split_rank"
    t.time "r_time"
    t.integer "r_rank"
    t.string "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "game_id"
    t.integer "state"
    t.boolean "total_check"
    t.boolean "s_check"
    t.boolean "b_check"
    t.boolean "split_check"
    t.boolean "r_check"
    t.index ["division_id"], name: "index_results_on_division_id"
    t.index ["member_id"], name: "index_results_on_member_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "school"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "topics", force: :cascade do |t|
    t.string "title"
    t.date "date"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "game_id"
    t.binary "image"
    t.string "path"
  end

end
