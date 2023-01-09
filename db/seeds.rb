# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ProductTransaction.destroy_all
Product.destroy_all
User.destroy_all

user_admin = User.create(names: 'Super', last_names: 'Admin', email: 'admin@teip.challenge', phone: '+19833664882', role: 'admin')

50.times do |index|

    new_product = Product.new(name: Faker::Commerce.product_name, 
        description: Faker::Commerce.department(max: 5),
        price: Faker::Commerce.price(range: 1..99.9),
        sku: Faker::Code.asin,
        status: 'in_stock',
        stock: 100)

    if new_product.valid?
        new_product.save

        ProductTransaction.create(affected_qty: 100,
            user_id: user_admin.id,
            new_balance: 100,
            old_balance: 0,
            operation: 'add',
            transaction_type: 'inventory_load',
            product_id: new_product.id
        )

        puts "Product added successfully: #{new_product.name}"
    else
        puts "Product cannot be added due to: #{new_product.errors.inspect}"
    end

end