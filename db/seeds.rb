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

Site.create!(	name: "Pacifica Portraits"
)

TmpArticle.create!(	name: "Home",
					description: "Example Home Page",
					order: 1,
					site_id: 1,
					visible: true,
					subtitle: "Truth in Photography",
					heading_1: "Guaranteed Beauty",
					article_1: "At Pacifica Portraits, we'll capture you on the outside the way you feel on the inside!"
)

TmpCard.create!(	name: "Our Services",
					description: "Example Services Page",
					order: 2,
					site_id: 1,
					visible: true,
					heading_1: "Studio Portraits",
					article_1: "Whether you want to look great for your company's website, or just in your next Facebook profile pic, nothing makes us happier than showing the world who you really are through beautiful portraiture.",
					heading_2: "Wedding Photography",
					article_2: "Love is in the air, so let us capture forever the beauty, elegance, and importance of your big day. Special rates and packages are available now!",
					heading_3: "Food/Product Photography",
					article_3: "Our talented photographers will take your business to the next level. With shots like these, your orders are bound to go through the roof!"
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