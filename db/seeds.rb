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

TmpArticle.create!(	name: "Home",
					description: "Example Home Page",
					order: 1,
					visible: true,
					subtitle: "The Beauty of Photography with The Power of a Database",
					article_1: "Here at StudioDB Photo Studio, we've been imposing joy and happiness on your faces for 12 years, and there's no stopping us now. While other studios might seek to generate inward joy first and hope it comes through in the final product, our approach is simpler. When you sit down with one of our IDF-trained photographers, we will tell you to adopt a bright and sunny expression exactly once, and you will comply. The difference with us is that we don't just take photos, we TAKE photos, and no one will stand in our way.

					It's our mission in life to extract only the most special, most memorable, and most genuine-seeming reactions and expressions from you and your extremely vulnerable family. And, while rumors of our tactics are slightly overblown, rest assured that the only ones intimidated by our results are our competitors and social subordinates. The truth is that not only will you appear to be a happier person in our portraits, but we'll be able to prove it in court by referring to the affidavit we had you sign.
					
					So call or swing by today and let us force you to appear happy!",
					heading_1: "We TAKE Photos!"
)

TmpCard.create!(	name: "About",
					description: "Example About Page",
					order: 2,
					visible: true,
					article_1: "Founded in 1996, and then again in 2008, our studio has been serving the community for just so many years now. Our owner always says, "If you have a face we have a camera!" Sure enough, that old addage applies to nearly half our customers.

					Over the past 12 years we've really started to get a hang for this whole photography thing. There's really a lot more to it than you would think!
					",
					heading_1: "Our Story",
					article_2: "David LaRue -
					
					David LaRue grew up on a remote Missouri farm where his parents taught him the value of hard work. In 1992, he graduated Summa Cum Laude from the University of Missouri with a degree in Science. After a six-year stint as Special Science Advisor to President Clinton, David put the President and Missouri behind him and traveled out West to start his on Photgraphy company.
					
					The rest is his story.",
					heading_2: "Our Founder",
					article_3: "At StudioDB Photo Studio all we want to do is make you smile and then flash a bright light in your face. That's what sets us apart from everyone else, and that's why you've developed a sever epilieptic reaction to all bright lights.
					
					That is now and always will be our promise to our customers.
					
					-David",
					heading_3: "Our Mission"
)