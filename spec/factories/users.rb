FactoryBot.define do
  factory :user do
    access_token { SecureRandom.alphanumeric(30) }
  end
end