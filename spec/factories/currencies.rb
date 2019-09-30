FactoryBot.define do
  factory :currency do
    name { "Currency name #{rand(1..1000)}" }
    rate { rand(10.0..100.0).ceil(4) }
  end
end