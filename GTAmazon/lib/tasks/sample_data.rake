namespace :db do
  desc 'Populates the database with sample data'
  task populate_sample_data: :environment do
    OrderProduct.destroy_all
    Product.destroy_all
    Manufacturer.destroy_all
    Order.destroy_all
    Client.destroy_all
    10.times do
      Client.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        dob: Faker::Date.birthday(18, 65)
      )
    end

    7.times do
      Manufacturer.create!(
        name: Faker::Company.name,
        location: Faker::Address.city
      )
    end

    client_ids = Client.all.map(&:id)
    20.times do
      Order.create!(
        date: Faker::Time.between(1.week.ago, Date.tomorrow, :all),
        order_num: Faker::Number.between(1,5),
        client_id: client_ids.sample
      )
    end

    manufacturer_ids = Manufacturer.all.map(&:id)
    20.times do
      Product.create!(
        name: Faker::Food.dish,
        model_num: Faker::Number.between(1, 1000),
        price: Faker::Number.between(1,100),
        manufacturer_id: manufacturer_ids.sample
      )
    end
    order_ids  = Order.all.map(&:id)
    product_ids  = Product.all.map(&:id)
    50.times do
      OrderProduct.create!(
        order_id: order_ids.sample,
        product_id: product_ids.sample,
        quantity: Faker::Number.between(1,5)
      )
    end
  end
end
