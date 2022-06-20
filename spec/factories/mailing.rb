html = <<-HTML.chomp
  <html>
    <body>
      <p> Hello {{ subscriber_full_name | fallback: 'there' }}!
        You spent {{ last_order_amount | fallback: '0' }} USD in your last order. </p>

      <p> Sent with love from {{ store_name }} </p>
    </body>
  </html>
HTML

FactoryBot.define do
  factory(:mailing) do
    from { FFaker::Internet.email }
    html { html }
    store { create(:store) }
    subject { FFaker::CheesyLingo.title }
  end
end
