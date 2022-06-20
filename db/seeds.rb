require 'securerandom'

# Create Store
store = Store.new
store.email = FFaker::Internet.email
store.name = FFaker::InternetSE.company_name_single_word
store.save!

puts "Created new store: #{store.name}"

# Create products
2.times do
  product = Product.new
  product.store_id = Store.pluck(:id).sample
  product.title = FFaker::CheesyLingo.title
  product.save!

  puts "Created new product #{product.title}"
end

# Create subscribers
7.times do
  subscriber = Subscriber.new
  subscriber.uid = SecureRandom.uuid
  subscriber.store_id = Store.pluck(:id).sample
  subscriber.email = FFaker::Internet.email
  subscriber.first_name = FFaker::Name.first_name
  subscriber.last_name = FFaker::Name.last_name
  subscriber.save!

  puts "Created new subscriber #{subscriber.first_name} #{subscriber.last_name}"
end

# Create orders for each subscriber
Subscriber.all.each do |subscriber|
  4.times do
    order = Order.new
    order.store_id = Store.pluck(:id).sample
    order.total = SecureRandom.random_number(200)
    order.subscriber_uid = subscriber.uid

    line_item = LineItem.new
    line_item.product_id = Product.pluck(:id).sample
    line_item.price = order.total
    line_item.quantity = 1

    order.line_items << line_item

    order.save!

    puts "Created new order for #{order.store_id}"
  end
end

# Create one mailing item
# For a store with orders and subscribers
mailing = Mailing.new
mailing.store_id = Store.pluck(:id).sample
mailing.from = FFaker::Internet.email
mailing.subject = FFaker::CheesyLingo.title
mailing.html = <<-HTML.chomp
  <html>
    <body>
      <p> Hello {{ subscriber_full_name | fallback: 'there' }}!
        You spent {{ last_order_amount | fallback: '0' }} USD in your last order. </p>

      <p> Sent with love from {{ store_name }} </p>
    </body>
  </html>
HTML
mailing.save!
