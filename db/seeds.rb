# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

ActiveRecord::Base.transaction do
  Product.destroy_all
  ShippingAddress.destroy_all
  Reverse.destroy_all
  User.destroy_all
  Buyer.destroy_all

  seller = User.create(
    name: Faker::Name.unique.name,
    email: 'seller@levei.co',
    password: 'qwe123',
    password_confirmation: 'qwe123'
  )

  buyer = Buyer.create(
    external_id: SecureRandom.hex(5).upcase,
    name: Faker::Name.unique.name,
    email: Faker::Internet.email
  )

  %i[exchange return].each do |reason|
    (1..7).each do |number|
      date = DateTime.now - number.days

      rand(5..15).times do
        buyer = Buyer.create(
          external_id: SecureRandom.hex(5).upcase,
          name: Faker::Name.unique.name,
          email: Faker::Internet.email,
          created_at: date,
          updated_at: date
        )

        reverse = Reverse.create(
          external_order_id: SecureRandom.hex(5).upcase,
          status: rand(0..3),
          reason: reason,
          reason_change_to: rand(0..1),
          buyer: buyer,
          user: seller,
          created_at: date,
          updated_at: date
        )

        ShippingAddress.create(
          address1: Faker::Address.street_name,
          address2: Faker::Address.secondary_address,
          number: Faker::Address.building_number,
          city: Faker::Address.city,
          state: Faker::Address.state,
          zipcode: Faker::Address.zip_code,
          reverse: reverse,
          created_at: date,
          updated_at: date
        )

        rand(1..3).times do
          Product.create(
            external_id: SecureRandom.hex(5).upcase,
            name: Faker::Commerce.product_name,
            price: Faker::Commerce.price,
            reverse: reverse,
            created_at: date,
            updated_at: date
          )
        end
      end
    end
  end
end