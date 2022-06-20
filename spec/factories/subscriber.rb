FactoryBot.define do
  factory(:subscriber) do
    email { FFaker::Internet.email }
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    store { create(:store) }
    uid { SecureRandom.uuid }
  end
end
