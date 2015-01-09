cities = ["Boston", "Somerville", "Jamaica Plain", "Cambridge"]

cities.each do |city|
  pizzerias = Yelp.client.search(city, term: "pizza",
                                       category_filter: "pizza",
                                       sort: 2)

  pizzerias.businesses.each do |pizzeria|
    pizza = Pizzeria.create(name: pizzeria.name,
                            street: pizzeria.location.address[0],
                            city: pizzeria.location.city,
                            state: pizzeria.location.state_code,
                            zip_code: pizzeria.location.postal_code,
                            phone: pizzeria.display_phone,
                            website: pizzeria.url,
                            photo: pizzeria.image_url)
    puts "Pizzeria #{pizza.name} created"
  end
end

20.times do
  user = User.create(email: Faker::Internet.email,
                     password: Faker::Internet.password,
                     username: Faker::Internet.user_name,
                     first_name: Faker::Name.first_name,
                     last_initial: Faker::Lorem.characters(1))
  puts "User #{user.username} created"
end

User.all.each do |user|
  Pizzeria.all.each do |pizzeria|
    review = Review.create(user: user, 
                           pizzeria: pizzeria,
                           title: Faker::Lorem.sentence(3),
                           body: (Faker::Lorem.paragraphs(2)).join,
                           rating: rand(1..5))
    puts "Review with title #{review.title} created"
  end
end

User.all.each do |user|
  Review.all.each do |review|
    comment = Comment.create(user: user,
                             review: review,
                             title: Faker::Lorem.sentence(2),
                             body: (Faker::Lorem.sentences(2)).join)
    puts "Comment #{comment.body} was created"
  end
end
