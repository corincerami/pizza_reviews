pizzerias = Yelp.client.search("Boston", { term: "pizza", 
                                           category_filter: "pizza",
                                           sort: 2 })

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

pizzerias = Yelp.client.search("Somerville", { term: "pizza", 
                                           category_filter: "pizza",
                                           sort: 2 })

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
pizzerias = Yelp.client.search("Cambridge", { term: "pizza", 
                                           category_filter: "pizza",
                                           sort: 2 })
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
pizzerias = Yelp.client.search("Jamaica Plain", { term: "pizza", 
                                           category_filter: "pizza",
                                           sort: 2 })
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
