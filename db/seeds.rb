# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Set pw
Rails.env.production? ? pw = ENV['ADMIN_PASSWORD'] : pw = Rails.application.credentials.dig(:PASSWORD)
pw ||= "password"

User.create!(	name:  "Chuck Crouse",
				email: "chucksef@gmail.com",
				password:              pw,
				password_confirmation: pw,
				admin: true,
				activated: true,
				activated_at: Time.zone.now)

User.create!(	name:  "Charlee Crouse",
				email: "todd.charlee@gmail.com",
				password:              "password",
				password_confirmation: "password",
				activated: true,
				activated_at: Time.zone.now)

40.times do |n|
	name  = Faker::Name.name
	email = "example-#{n+1}@railstutorial.org"
	password = "password"
	User.create!(	name:  name,
					email: email,
					password:              password,
					password_confirmation: password,
					activated: true,
					activated_at: Time.zone.now)
end

Site.create!(	name: "Pacifica Portraiture"
)

TmpArticle.create!(	name: "Home",
					subtitle: "Truth in Photography",
					description: "Example Home Page",
					order: 1,
					site_id: 1,
					visible: true
)

Article.create!(	title: "Truth in Photography",
					body: "At Pacifica Portraiture, our guarantee of Truth means that we'll spend the time we need to work with you—not against you!—to capture you on the outside the way you feel on the inside! For some people, Truth means a warm, joyful smile. For others, Truth is stark relief and a steely glance. No matter what you're going for, we'll take our time in capturing the perfect images that present to the world the look and style that you inhabit.\r\nThat's our promise and your guarantee.\r\n- Pacifica",
					site_item_id: 1
)

TmpCard.create!(	name: "Our Services",
					description: "Example Services Page",
					order: 2,
					site_id: 1,
					visible: true
)

TmpGroup.create!(	name: "Galleries",
					order: 3,
					site_id: 1,
					visible: true,
					description: "Example Group"
)

TmpGallery.create!(	name: "Food",
					order: 4,
					site_id: 1,
					visible: true,
					description: "Example Gallery Page"
)