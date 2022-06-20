FactoryBot.define do
  factory(:store) do
    email { FFaker::Internet.email }
    name { FFaker::InternetSE.company_name_single_word }
  end
end
