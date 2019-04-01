FactoryBot.define do
  factory :category do
    sequence(:name) { |i| "Tiro#{i}" }
  end
end
