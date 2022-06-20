FactoryBot.define do
  factory(:order) do
    store { create(:store) }
    subscriber { create(:subscriber) }
    total { SecureRandom.random_number(200) }
  end
end
