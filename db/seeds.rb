require 'faker'

puts 'Cleaning database...'
Booking.delete_all
User.delete_all
Item.delete_all

puts 'Creating users...'
users = 10.times.map do
    User.create!(
    username:              Faker::Internet.unique.username(specifier: 5..8),
    email:                 Faker::Internet.unique.email,
    password:              'password',
    password_confirmation: 'password'
  )
end

puts "Creating items..."
categories = %w[t-shirts hoodies jackets shoes accessories]
sizes      = %w[S M L]
brands     = %w[Asket Acne Carhart]

items = 20.times.map do
  Item.create!(
    title:       Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph(sentence_count: 2),
    image_url:   Faker::LoremFlickr.image(size: "300x300", search_terms: ['product']),
    price:       Faker::Commerce.price(range: 5.0..500.0),
    category:    categories.sample,
    size:        sizes.sample,
    brand:       brands.sample,
    user:        users.sample
  )
end

puts "Creating bookings..."
10.times do
  start_date = Faker::Date.forward(days: 30)
  end_date   = start_date + rand(1..7).days

  Booking.create!(
    user:       users.sample,
    item:       items.sample,
    start_date: start_date,
    end_date:   end_date
  )
end

puts "Seeding done!"
