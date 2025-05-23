

require 'faker'

puts 'Cleaning database...'
Booking.destroy_all
User.destroy_all
Item.destroy_all

puts 'Creating users...'
user1 = User.create!(
  username:              'username',
  email:                 'user@username.com',
  password:              'password',
  password_confirmation: 'password'
)

puts 'Creating items...'

sizes = ["XS", "S", "M", "L", "XL"]
brands = ["RetroVibe", "ClassicWear", "VintageFinds", "OldSchool", "TimelessThreads"]
vintage_styles = ["50s", "60s", "70s", "80s", "90s", "Retro", "Rockabilly", "Mod", "Boho", "Disco", "Classic"]

items_data = [
  # ... [same 50 items as before] ...
  { name: "Polka Dot Swing Dress", category: "Dresses" },
  { name: "Cherry Print Halter Dress", category: "Dresses" },
  { name: "Floral Tea Dress", category: "Dresses" },
  { name: "Plaid Shirt Dress", category: "Dresses" },
  { name: "Cap Sleeve Wiggle Dress", category: "Dresses" },
  { name: "Tie-Front Blouse", category: "Tops" },
  { name: "Cap Sleeve Knit Top", category: "Tops" },
  { name: "Off-Shoulder Bardot Top", category: "Tops" },
  { name: "Sleeveless Button-Up Blouse", category: "Tops" },
  { name: "Striped Crop Top", category: "Tops" },
  { name: "Pencil Skirt", category: "Skirts" },
  { name: "Circle Skirt", category: "Skirts" },
  { name: "Tartan Mini Skirt", category: "Skirts" },
  { name: "Pleated Swing Skirt", category: "Skirts" },
  { name: "Button-Front Cord Skirt", category: "Skirts" },
  { name: "High-Waisted Cuffed Jeans", category: "Jeans" },
  { name: "Wide-Leg Button Jeans", category: "Jeans" },
  { name: "Checked Slacks", category: "Bottoms" },
  { name: "Sailor Button Pants", category: "Bottoms" },
  { name: "Retro Pedal Pushers", category: "Bottoms" },
  { name: "Leather Moto Jacket", category: "Jackets" },
  { name: "Fringe Suede Jacket", category: "Jackets" },
  { name: "Bolero Shrug", category: "Jackets" },
  { name: "Cropped Denim Jacket", category: "Jackets" },
  { name: "Faux Fur Collar Coat", category: "Jackets" },
  { name: "Creepers", category: "Shoes" },
  { name: "Peep-Toe Pumps", category: "Shoes" },
  { name: "Saddle Shoes", category: "Shoes" },
  { name: "T-Strap Heels", category: "Shoes" },
  { name: "Platform Mary Janes", category: "Shoes" },
  { name: "Cat-Eye Glasses", category: "Glasses" },
  { name: "Retro Clear Lenses", category: "Glasses" },
  { name: "Aviator Sunglasses", category: "Glasses" },
  { name: "Round Wire Glasses", category: "Glasses" },
  { name: "Tinted Oversized Glasses", category: "Glasses" },
  { name: "Pillbox Hat", category: "Hats" },
  { name: "Leopard Print Beret", category: "Hats" },
  { name: "Feather Fascinator", category: "Hats" },
  { name: "Classic Fedora", category: "Hats" },
  { name: "Velvet Cloche Hat", category: "Hats" },
  { name: "Vintage Brooch", category: "Accessories" },
  { name: "Pearl Choker Necklace", category: "Accessories" },
  { name: "Polka Dot Headscarf", category: "Accessories" },
  { name: "Lace Gloves", category: "Accessories" },
  { name: "Bakelite Bangle Set", category: "Accessories" },
  { name: "Embroidered Cardigan", category: "Tops" },
  { name: "Bow Back Wiggle Dress", category: "Dresses" },
  { name: "Retro Bowling Shirt", category: "Tops" },
  { name: "Rockabilly Bandana", category: "Accessories" },
  { name: "Swing Coat", category: "Jackets" }
].sort_by { |item| item[:name] }




absolute_path = File.join("app/assets/images/seed_file/41UG52cb49L._SL500_.jpg")
image_file_directory = File.dirname(absolute_path)
image_files = Dir.children(image_file_directory)
p image_files

image_files = image_files.select do |file|
  File.extname(file) == ".jpg"
end.sort

p image_files.count
counter = 0
  items = items_data.map do |data|
  style = vintage_styles.sample
  item = Item.new(
    title:       "#{style} #{data[:name]}",
    description: "#{style}-inspired #{data[:name]} perfect for vintage lovers.",
    #image_url:   "https://source.unsplash.com/300x300/?vintage,#{data[:category].downcase},#{rand(1000)}",
    price:       Faker::Commerce.price(range: 10.0..50.0),
    category:    data[:category],
    size:        sizes.sample,
    brand:       brands.sample,
    user:        user1
  )
  p image_files[counter]
  p data
  file = File.open(File.join(image_file_directory, image_files[counter]))
  item.photo.attach(io: file, filename: image_files[counter], content_type: "image/jpg")
  item.save!
  puts "item created!"
  counter += 1
end

puts "Created #{items.count} items."

puts "Creating bookings..."
10.times do
  start_date = Faker::Date.forward(days: 30)
  end_date   = start_date + rand(1..7).days

  Booking.create!(
    user:       user1,
    item:       items.sample,
    start_date: start_date,
    end_date:   end_date
  )
end

puts "Seeding done!"
