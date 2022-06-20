FactoryBot.define do
  factory(:subscriber) do
    sequence(:email) { |n| "person#{n}@example.com" }
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    store { create(:store) }
    uid { SecureRandom.uuid }
  end
end
