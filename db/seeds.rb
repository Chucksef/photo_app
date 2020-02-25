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

Site.create!(		name: "Pacifica Portraiture"
)

TmpArticle.create!(	name: "Our Mission",
					subtitle: "Truth in Photography",
					description: "Simple Article Page",
					order: 2,
					site_id: 1,
					visible: true,
					slug: "our-mission"
)


TmpCard.create!(	name: "Our Services",
					description: "Description of Services Offered",
					order: 3,
					site_id: 1,
					visible: true
)

TmpGroup.create!(	name: "Galleries",
					order: 4,
					site_id: 1,
					visible: true,
					description: "Simple Group to Hold Galleries"
)

TmpGallery.create!(	name: "Food",
					order: 5,
					site_id: 1,
					tmp_group_id: 3,
					visible: true,
					description: "Example Gallery Page"
)

TmpSplash.create!(	name: "Home",
					order: 1,
					site_id: 1,
					visible: true,
					description: "Simple Splash Page"
)

Article.create!(	title: "Truth in Photography",
					body: "At Pacifica Portraiture, our guarantee of Truth means that we'll spend the time we need to work with you—not against you!—to capture you on the outside the way you feel on the inside! For some people, Truth means a warm, joyful smile. For others, Truth is stark relief and a steely glance. No matter what you're going for, we'll take our time in capturing the perfect images that present to the world the look and style that you inhabit.\r\nThat's our promise and your guarantee.\r\n- Pacifica",
					page_id: 1
)

Article.create!(	title: "Studio Portraits",
					body: "Whether you want to look great for your company's website, or just in your next Facebook profile pic, nothing makes us happier than showing the world who you really are through beautiful portraiture.",
					page_id: 2
)

Article.create!(	title: "Wedding Photography",
					body: "Love is in the air, so let us capture forever the beauty, elegance, and importance of your big day. Special rates and packages are available now!",
					page_id: 2
)

Article.create!(	title: "Product Photography",
					body: "Our talented photographers will take your business to the next level. With shots like these, your orders are bound to go through the roof!",
					page_id: 2
)

Article.create!(	title: "Welcome to Pacifica",
					body: "Welcome to Pacifica Portraiture. Your home town stop for unbelievable portraits no matter where you live in Northern California.\r\nWhether you're a Gourmet Chef, Real Estate Mogul, TV News Personality, or Awesome Mom, we've got you covered!",
					page_id: 5
)