# Clear the DB

# Create users

20.times do
  User.create({
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    city: "Tel Aviv"
    description: Faker::Quote.famous_last_words,

  })

create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "city"
    t.string "description"
    t.string "profile_image"
    t.string "height"
    t.string "strength"
    t.string "language"
    t.string "hidden_talent"
    t.integer "talkativeness"
    t.integer "funniness"
    t.string "username"
    t.integer "age"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
