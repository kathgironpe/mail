FactoryBot.define do
  factory(:product) do
    store  { create(:store) }
    title { FFaker::CheesyLingo.title }
  end
end
