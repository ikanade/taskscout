# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(name:"Ishan Kanade",email:"ekanade@gmail.com",password:"password",password_confirmation:"password",confirmed_at:Time.now)
puts "Creating users..."
100.times do |count|
	name = Faker::Name.name
	email = "example-#{count}@gmail.com"
	password = "password"
	User.create(name:name,
		email:email,
		password:password,
		password_confirmation:password,
		confirmed_at:Time.now)

end
puts "Creating projects..."
5.times do |count|
	title = Faker::Hipster.sentence
	start = Time.now
	description = Faker::Hipster.paragraph
	deadline = rand(30).days.from_now
	project = Project.create!(
		title: title,
		deadline: deadline,
		started_at: start,
		user_id: 1,
		description: description
		)
end
20.times do |count|
	title = Faker::Hipster.sentence
	start = Time.now
	description = Faker::Hipster.paragraph
	deadline = rand(30).days.from_now
	project = Project.create!(
		title: title,
		deadline: deadline,
		started_at: start,
		user_id: rand(1..20),
		description: description
		)
end
puts "Adding members to projects..."
50.times do |count|
	user = User.find(rand(20..User.count))
	project = Project.find(rand(1..Project.count))
	if project.creator != user and !project.members.include?(user)
		project.members << user
	end	
	project = Project.find(rand(1..Project.count))
	project.tasks.create(
		title: Faker::Lorem.sentence(3, true, 4),
		user_id: rand(1..User.count),
		description: Faker::Lorem.paragraph,
		started_at: Time.now,
		due_date: rand(31).days.from_now
		)

	task = Task.find(rand(1..Task.count))
	task.tasks.create(
		title: Faker::Lorem.sentence(3, true, 4),
		user_id: rand(1..User.count),
		description: Faker::Lorem.paragraph,
		started_at: Time.now,
		due_date: rand(31).days.from_now
		)
end
100.times do |count|
	task = Task.find(rand(1..Task.count))
	task.comments.create(
		body: Faker::Hacker.say_something_smart,
		user_id: rand(1..User.count)
		)
end 

30.times do |count|
	project = Project.find(rand(1..Project.count))
	project.posts.create(
		title: Faker::Lorem.sentence(3, true, 4),
		user_id: rand(1..User.count),
		body: Faker::Hacker.say_something_smart)
end