FactoryBot.define do
  factory(:line_item) do
    order  { create(:order) }
    price { SecureRandom.random_number(200) }
    product  { create(:product) }
    quantity { 1 }
  end
end
