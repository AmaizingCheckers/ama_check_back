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

ActiveRecord::Schema.define(version: 20180710071531) do

  create_table "classrooms", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_classrooms_on_school_id", using: :btree
  end

  create_table "histories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "timestamp",  default: -> { "CURRENT_TIMESTAMP" }
    t.integer  "subject_id"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "image_name"
    t.index ["subject_id"], name: "index_histories_on_subject_id", using: :btree
  end

  create_table "history_students", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "history_id"
    t.integer  "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["history_id"], name: "index_history_students_on_history_id", using: :btree
    t.index ["student_id"], name: "index_history_students_on_student_id", using: :btree
  end

  create_table "schools", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "student_id"
    t.string   "image_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_student_images_on_student_id", using: :btree
  end

  create_table "students", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "sex"
    t.integer  "grade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subject_students", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "subject_id"
    t.integer  "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_subject_students_on_student_id", using: :btree
    t.index ["subject_id"], name: "index_subject_students_on_subject_id", using: :btree
  end

  create_table "subjects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "classroom_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["classroom_id"], name: "index_subjects_on_classroom_id", using: :btree
  end

  create_table "teacher_classrooms", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "teacher_id"
    t.integer  "classroom_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["classroom_id"], name: "index_teacher_classrooms_on_classroom_id", using: :btree
    t.index ["teacher_id"], name: "index_teacher_classrooms_on_teacher_id", using: :btree
  end

  create_table "teacher_subjects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "teacher_id"
    t.integer  "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id"], name: "index_teacher_subjects_on_subject_id", using: :btree
    t.index ["teacher_id"], name: "index_teacher_subjects_on_teacher_id", using: :btree
  end

  create_table "teachers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_teachers_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "provider",                             default: "email", null: false
    t.string   "uid",                                  default: "",      null: false
    t.string   "encrypted_password",                   default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean  "allow_password_change",                default: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "email"
    t.text     "tokens",                 limit: 65535
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree
  end

  add_foreign_key "classrooms", "schools"
  add_foreign_key "histories", "subjects"
  add_foreign_key "history_students", "histories"
  add_foreign_key "history_students", "students"
  add_foreign_key "student_images", "students"
  add_foreign_key "subject_students", "students"
  add_foreign_key "subject_students", "subjects"
  add_foreign_key "subjects", "classrooms"
  add_foreign_key "teacher_classrooms", "classrooms"
  add_foreign_key "teacher_classrooms", "teachers"
  add_foreign_key "teacher_subjects", "subjects"
  add_foreign_key "teacher_subjects", "teachers"
  add_foreign_key "teachers", "users"
end
