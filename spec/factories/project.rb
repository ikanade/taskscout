factory :project do |f|
	title {Faker::Name.name}
	deadline {Faker::Date.between(1.days.ago, Date.today)}
	deadline {Faker::Date.between(1.days.ago, Date.today)}
	description {Faker::Lorem.paragraph}
	t.string   "title"
    t.datetime "deadline"
    t.datetime "started_at"
    t.integer  "progress",    default: 0
    t.boolean  "archive"
    t.integer  "user_id"
end