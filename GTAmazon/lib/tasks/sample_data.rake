namespace :db do
  desc 'Populates the database with sample data'
  task populate_sample_data: :environment do
    10.times { Client.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, dob: Faker::Date.birthday(18, 65)) }
    7.times  { Manufacturer.create!(name: Faker::Company.name, location: Faker::Address.city) }
    20.times  { Order.create!(date: Faker::Date.between(1.week.ago, Date.today), order_num: Faker::Number.between(1,5) , client_id: Faker::Number.between(1,9) ) }
    20.times  { Product.create!(name: Faker::Food.dish, model_num: Faker::Number.between(1, 1000) , price: Faker::Number.between(1,100), manufacturer_id: Faker::Number.between(1,7) ) }
    50.times  { OrderProduct.create!(order_id: Faker::Number.between(1, 20), product_id: Faker::Number.between(1, 20), quantity: Faker::Number.between(1,5)) }
  end
end
